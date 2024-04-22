clc, close all

load('tomcat_main.mat');% Import Object
load('tomcat_left.mat');
load('tomcat_right.mat');
load('tomcat_cockpit.mat');
load('tomcat_flame.mat');

[ya1, Fs1] = audioread('sfx_dangerzone.mp3'); % Import Audio files
dangerzone = audioplayer(ya1, Fs1);
[ya2, Fs2] = audioread('sfx_flyby1.mp3'); 
flyby1 = audioplayer(ya2, Fs2);
[ya3, Fs3] = audioread('sfx_flyby2.mp3'); 
flyby2 = audioplayer(ya3, Fs3);
[ya4, Fs4] = audioread('sfx_cruise.mp3'); 
cruise = audioplayer(ya4, Fs4);
[ya5, Fs5] = audioread('sfx_rumble.mp3'); 
rumbling = audioplayer(ya5, Fs5);
[ya6, Fs6] = audioread('sfx_servo.mp3'); 
servo = audioplayer(ya6, Fs6);
[ya7, Fs7] = audioread('sfx_afterburner.mp3'); 
afterburner = audioplayer(ya7, Fs7);
[ya8, Fs8] = audioread('sfx_roll.mp3'); 
rolling = audioplayer(ya8, Fs8);

tomcat_main_facets = tomcat_main.ConnectivityList;
tomcat_left_facets = tomcat_left.ConnectivityList;
tomcat_right_facets = tomcat_right.ConnectivityList;
tomcat_cockpit_facets = tomcat_cockpit.ConnectivityList;
tomcat_flame_facets = tomcat_flame.ConnectivityList;

scale = 6.2;
aspect_ratio = 16/9;
grey = [0.8 0.8 0.8];

animation = figure('Units','pixels','Position',[100 100 600 600/aspect_ratio],'ToolBar','none');

for i = 1:7000

    if i < 300 % Scene 1

        if i == 1 % Initial Plots
        
            translate = [-2500 25 20];
            translate2 = [-2530 -25 0];
            tomcat_main_verts = (tomcat_main.Points)*scale + translate;
            tomcat_left_verts = (tomcat_left.Points)*scale + translate;
            tomcat_right_verts = (tomcat_right.Points)*scale + translate;
            tomcat_cockpit_verts = (tomcat_cockpit.Points)*scale + translate;
            tomcat2_main_verts = (tomcat_main.Points)*scale + translate2;
            tomcat2_left_verts = (tomcat_left.Points)*scale + translate2;
            tomcat2_right_verts = (tomcat_right.Points)*scale + translate2;
            tomcat2_cockpit_verts = (tomcat_cockpit.Points)*scale + translate2;
    
            tomcat_main_plot = patch('Faces',tomcat_main_facets,'Vertices',tomcat_main_verts);
            hold on
            tomcat_main_plot.EdgeColor = 'none';
            tomcat_main_plot.FaceColor = grey;
            tomcat_main_plot.Clipping = 'off';
            tomcat_left_plot = patch('Faces',tomcat_left_facets,'Vertices',tomcat_left_verts);
            tomcat_left_plot.EdgeColor = 'none';
            tomcat_left_plot.FaceColor = grey;
            tomcat_left_plot.Clipping = 'off';
            tomcat_right_plot = patch('Faces',tomcat_right_facets,'Vertices',tomcat_right_verts);
            tomcat_right_plot.EdgeColor = 'none';
            tomcat_right_plot.FaceColor = grey;
            tomcat_right_plot.Clipping = 'off';
            tomcat_cockpit_plot = patch('Faces',tomcat_cockpit_facets,'Vertices',tomcat_cockpit_verts);
            tomcat_cockpit_plot.EdgeColor = 'none';
            tomcat_cockpit_plot.FaceColor = [0.7 0.7 1];
            tomcat_cockpit_plot.Clipping = 'off';
            tomcat2_main_plot = patch('Faces',tomcat_main_facets,'Vertices',tomcat2_main_verts);
            tomcat2_main_plot.EdgeColor = 'none';
            tomcat2_main_plot.FaceColor = grey;
            tomcat2_main_plot.Clipping = 'off';
            tomcat2_left_plot = patch('Faces',tomcat_left_facets,'Vertices',tomcat2_left_verts);
            tomcat2_left_plot.EdgeColor = 'none';
            tomcat2_left_plot.FaceColor = grey;
            tomcat2_left_plot.Clipping = 'off';
            tomcat2_right_plot = patch('Faces',tomcat_right_facets,'Vertices',tomcat2_right_verts);
            tomcat2_right_plot.EdgeColor = 'none';
            tomcat2_right_plot.FaceColor = grey;
            tomcat2_right_plot.Clipping = 'off';
            tomcat2_cockpit_plot = patch('Faces',tomcat_cockpit_facets,'Vertices',tomcat2_cockpit_verts);
            tomcat2_cockpit_plot.EdgeColor = 'none';
            tomcat2_cockpit_plot.FaceColor = [0.7 0.7 1];
            tomcat2_cockpit_plot.Clipping = 'off';
            light
            axis equal
            set(gca,'Visible','off')
    
            [ocean_x,ocean_y] = meshgrid(-81.5:1:81.5);
            [sim_x,sim_y] = meshgrid(-20:1:20);
            wave_height = zeros(size(ocean_x));
            ocean = surf(ocean_x,ocean_y,wave_height);
            ocean.Clipping = 'off';
            ocean.FaceColor = [0 0.1 0.6];
            ocean.EdgeColor = 'none';
            ocean.FaceAlpha = 0.7;
            ocean.FaceLighting = 'phong';
    
        end
    
        % Update Plots
    
        translation_vec = [15 0 0];
    
        tomcat_main_verts = tomcat_main_verts + translation_vec;
        tomcat_left_verts = tomcat_left_verts + translation_vec;
        tomcat_right_verts = tomcat_right_verts + translation_vec;
        tomcat_cockpit_verts = tomcat_cockpit_verts + translation_vec;
        tomcat2_main_verts = tomcat2_main_verts + translation_vec;
        tomcat2_left_verts = tomcat2_left_verts + translation_vec;
        tomcat2_right_verts = tomcat2_right_verts + translation_vec;
        tomcat2_cockpit_verts = tomcat2_cockpit_verts + translation_vec;
    
        set(tomcat_main_plot,'Vertices',tomcat_main_verts);
        set(tomcat_left_plot,'Vertices',tomcat_left_verts);
        set(tomcat_right_plot,'Vertices',tomcat_right_verts);
        set(tomcat_cockpit_plot,'Vertices',tomcat_cockpit_verts);
        set(tomcat2_main_plot,'Vertices',tomcat2_main_verts);
        set(tomcat2_left_plot,'Vertices',tomcat2_left_verts);
        set(tomcat2_right_plot,'Vertices',tomcat2_right_verts);
        set(tomcat2_cockpit_plot,'Vertices',tomcat2_cockpit_verts);
    
        wave_speed = 0.5;
    
        wave_1 = 0.6*exp(sin(0.2*sim_x + -1.4*sim_y + 0.2*i));
        wave_2 = 0.5*exp(sin(1.2*sim_x + -1.6*sim_y + 0.2*i));
        wave_3 = 0.2*exp(sin(1.6*sim_x + -0.8*sim_y + 0.5*i));
        wave_height = repmat((wave_1 + wave_2 + wave_3) - 30,4);
        ocean.ZData = wave_height;
    
        axis([-111 111 -111 111 -10 50])
        view(-90,90)
        camva(9.5)
        zoom(4)
        camtarget([0 0 0])

        meanx = mean(tomcat_main_verts(:,1));
    
        pause(0.01)

        if i == 299
            clf
        end

        if i == 100
            play(dangerzone)
        end

        if i == 45
            play(flyby1)
        end
    
    end

    if (300 <= i) && (i < 1500) % Scene 2

        sky_size = 6000;
        skybox_verts = [-sky_size -sky_size -100;sky_size -sky_size -100;sky_size -sky_size sky_size;-sky_size -sky_size sky_size;-sky_size sky_size sky_size;-sky_size sky_size -100;sky_size sky_size -100; sky_size sky_size sky_size];
        skybox_facets = [1 2 3 4;4 1 6 5;5 6 7 8;8 7 2 3;3 4 5 8];
        skyC = [1;1;9;9;9;1;1;9];

            if i == 300
    
                translate = [0 0 2000];
                translate2 = [-20 -30 -20];
    
                tomcat_main2_verts = (tomcat_main.Points)*scale + translate;
                tomcat_left2_verts = (tomcat_left.Points)*scale + translate;
                tomcat_right2_verts = (tomcat_right.Points)*scale + translate;
                tomcat_cockpit2_verts = (tomcat_cockpit.Points)*scale + translate;
        
                tomcat2_main2_verts = tomcat_main2_verts + translate2;
                tomcat2_left2_verts = tomcat_left2_verts + translate2;
                tomcat2_right2_verts = tomcat_right2_verts + translate2;
                tomcat2_cockpit2_verts = tomcat_cockpit2_verts + translate2;
    
                tomcat_main2_plot = patch('Faces',tomcat_main_facets,'Vertices',tomcat_main2_verts);
                hold on
                tomcat_main2_plot.EdgeColor = 'none';
                tomcat_main2_plot.FaceColor = grey;
                tomcat_main2_plot.Clipping = 'off';
                tomcat_left2_plot = patch('Faces',tomcat_left_facets,'Vertices',tomcat_left2_verts);
                tomcat_left2_plot.EdgeColor = 'none';
                tomcat_left2_plot.FaceColor = grey;
                tomcat_left2_plot.Clipping = 'off';
                tomcat_right2_plot = patch('Faces',tomcat_right_facets,'Vertices',tomcat_right2_verts);
                tomcat_right2_plot.EdgeColor = 'none';
                tomcat_right2_plot.FaceColor = grey;
                tomcat_right2_plot.Clipping = 'off';
                tomcat_cockpit2_plot = patch('Faces',tomcat_cockpit_facets,'Vertices',tomcat_cockpit2_verts);
                tomcat_cockpit2_plot.EdgeColor = 'none';
                tomcat_cockpit2_plot.FaceColor = [0.7 0.7 1];
                tomcat_cockpit2_plot.Clipping = 'off';
        
                tomcat2_main2_plot = patch('Faces',tomcat_main_facets,'Vertices',tomcat2_main2_verts);
                tomcat2_main2_plot.EdgeColor = 'none';
                tomcat2_main2_plot.FaceColor = grey;
                tomcat2_main2_plot.Clipping = 'off';
                tomcat2_left2_plot = patch('Faces',tomcat_left_facets,'Vertices',tomcat2_left2_verts);
                tomcat2_left2_plot.EdgeColor = 'none';
                tomcat2_left2_plot.FaceColor = grey;
                tomcat2_left2_plot.Clipping = 'off';
                tomcat2_right2_plot = patch('Faces',tomcat_right_facets,'Vertices',tomcat2_right2_verts);
                tomcat2_right2_plot.EdgeColor = 'none';
                tomcat2_right2_plot.FaceColor = grey;
                tomcat2_right2_plot.Clipping = 'off';
                tomcat2_cockpit2_plot = patch('Faces',tomcat_cockpit_facets,'Vertices',tomcat2_cockpit2_verts);
                tomcat2_cockpit2_plot.EdgeColor = 'none';
                tomcat2_cockpit2_plot.FaceColor = [0.7 0.7 1];
                tomcat2_cockpit2_plot.Clipping = 'off';

                skybox = patch('Faces',skybox_facets,'Vertices',skybox_verts,'FaceVertexCData',skyC);
                skybox.Clipping = 'off';
                skybox.FaceColor = 'interp';
                skybox.EdgeColor = 'none';
                skybox.FaceLighting = 'none';
                colormap('sky');
                axis equal
                material metal
                light

            end

            campos([(-i*5 + 5000) 200 1900]);
            camtarget([0 0 2000]);
            camva(10)
            pause(0.01);

            if i == 650
                play(flyby2)
            end

            if i == 1499
                clf
            end

    end

    if (1500 <= i) && (i < 2900) % Scene 3
    
                if i == 1500

                    speed = 1;
    
                    [ocean_x,ocean_y] = meshgrid(0:1:159,-39.5:1:39.5);
                    wave_height = zeros(size(ocean_x));
            
                    translate = [0 70 30];
                    translate2 = [-20 -50 -20];
                    scale = 6.2;
            
                    tomcat_main_verts = (tomcat_main.Points)*scale + translate;
                    tomcat_left_verts = (tomcat_left.Points)*scale + translate;
                    tomcat_right_verts = (tomcat_right.Points)*scale + translate;
                    tomcat_cockpit_verts = (tomcat_cockpit.Points)*scale + translate;
                    tomcat2_main_verts = tomcat_main_verts + translate2;
                    tomcat2_left_verts = tomcat_left_verts + translate2;
                    tomcat2_right_verts = tomcat_right_verts + translate2;
                    tomcat2_cockpit_verts = tomcat_cockpit_verts + translate2;
            
                    ocean = surf(ocean_x,ocean_y,wave_height);
                    hold on
                    ocean.Clipping = 'off';
                    ocean.FaceColor = [0 0.1 0.6];
                    ocean.EdgeColor = 'none';
                    ocean.FaceAlpha = 0.7;
                    ocean.FaceLighting = 'phong';
            
                    tomcat_main_plot = patch('Faces',tomcat_main_facets,'Vertices',tomcat_main_verts);
                    tomcat_main_plot.EdgeColor = 'none';
                    tomcat_main_plot.FaceColor = grey;
                    tomcat_main_plot.Clipping = 'off';
                    tomcat_left_plot = patch('Faces',tomcat_left_facets,'Vertices',tomcat_left_verts);
                    tomcat_left_plot.EdgeColor = 'none';
                    tomcat_left_plot.FaceColor = grey;
                    tomcat_left_plot.Clipping = 'off';
                    tomcat_right_plot = patch('Faces',tomcat_right_facets,'Vertices',tomcat_right_verts);
                    tomcat_right_plot.EdgeColor = 'none';
                    tomcat_right_plot.FaceColor = grey;
                    tomcat_right_plot.Clipping = 'off';
                    tomcat_cockpit_plot = patch('Faces',tomcat_cockpit_facets,'Vertices',tomcat_cockpit_verts);
                    tomcat_cockpit_plot.EdgeColor = 'none';
                    tomcat_cockpit_plot.FaceColor = [0.7 0.7 1];
                    tomcat_cockpit_plot.Clipping = 'off';
                    tomcat2_main_plot = patch('Faces',tomcat_main_facets,'Vertices',tomcat2_main_verts);
                    tomcat2_main_plot.EdgeColor = 'none';
                    tomcat2_main_plot.FaceColor = grey;
                    tomcat2_main_plot.Clipping = 'off';
                    tomcat2_left_plot = patch('Faces',tomcat_left_facets,'Vertices',tomcat2_left_verts);
                    tomcat2_left_plot.EdgeColor = 'none';
                    tomcat2_left_plot.FaceColor = grey;
                    tomcat2_left_plot.Clipping = 'off';
                    tomcat2_right_plot = patch('Faces',tomcat_right_facets,'Vertices',tomcat2_right_verts);
                    tomcat2_right_plot.EdgeColor = 'none';
                    tomcat2_right_plot.FaceColor = grey;
                    tomcat2_right_plot.Clipping = 'off';
                    tomcat2_cockpit_plot = patch('Faces',tomcat_cockpit_facets,'Vertices',tomcat2_cockpit_verts);
                    tomcat2_cockpit_plot.EdgeColor = 'none';
                    tomcat2_cockpit_plot.FaceColor = [0.7 0.7 1];
                    tomcat2_cockpit_plot.Clipping = 'off';
            
                    light
                    axis equal
                    set(gca,'Visible','off')
    
                    play(rumbling)
                    play(cruise)
            
                end
            
                [ocean_x,ocean_y] = meshgrid((speed*(i - 1500) - 79.5):1:(speed*(i - 1500) + 79.5),(speed*(i - 1500) - 39.5):1:(speed*(i - 1500) + 39.5)); 
                wave_1 = 0.6*exp(sin(0.2*ocean_x + -1.4*ocean_y + 0.02*i));
                wave_2 = 0.5*exp(sin(1.2*ocean_x + -1.6*ocean_y + 0.02*i));
                wave_3 = 0.2*exp(sin(1.6*ocean_x + -0.8*ocean_y + 0.05*i));
                wave_height = ((wave_1 + wave_2 + wave_3) - 30);
                ocean.XData = ocean_x;
                ocean.ZData = wave_height;

    
                translation_vec = [speed+0.01*cos(0.04*i) 0.02*sin(0.04*i) 0];
                translation2_vec = [speed+0.02*sin(0.04*i) 0.01*cos(0.04*i) 0];
    
                tomcat_main_verts = tomcat_main_verts + translation_vec;
                tomcat_left_verts = tomcat_left_verts + translation_vec;
                tomcat_right_verts = tomcat_right_verts + translation_vec;
                tomcat_cockpit_verts = tomcat_cockpit_verts + translation_vec;
                tomcat2_main_verts = tomcat2_main_verts + translation2_vec;
                tomcat2_left_verts = tomcat2_left_verts + translation2_vec;
                tomcat2_right_verts = tomcat2_right_verts + translation2_vec;
                tomcat2_cockpit_verts = tomcat2_cockpit_verts + translation2_vec;
    
                set(tomcat_main_plot,'Vertices',tomcat_main_verts);
                set(tomcat_left_plot,'Vertices',tomcat_left_verts);
                set(tomcat_right_plot,'Vertices',tomcat_right_verts);
                set(tomcat_cockpit_plot,'Vertices',tomcat_cockpit_verts);
                set(tomcat2_main_plot,'Vertices',tomcat2_main_verts);
                set(tomcat2_left_plot,'Vertices',tomcat2_left_verts);
                set(tomcat2_right_plot,'Vertices',tomcat2_right_verts);
                set(tomcat2_cockpit_plot,'Vertices',tomcat2_cockpit_verts);

                meanx_main = mean(tomcat_main_verts(:,1));
                meany_main = mean(tomcat_main_verts(:,2));
                meanz_main = mean(tomcat_main_verts(:,3));
            
                meanx2_main = mean(tomcat2_main_verts(:,1));
                meany2_main = mean(tomcat2_main_verts(:,2));
                meanz2_main = mean(tomcat2_main_verts(:,3));
    
                camtarget([(meanx_main + meanx2_main)/2 (meany_main + meany2_main)/2 (meanz_main + meanz2_main)/2])
                campos([(meanx_main + meanx2_main)/2 ((meany_main + meany2_main)/2)+50 ((meanz_main + meanz2_main)/2)+50])
                camva(30)

    
                if i == 2899
                    stop(rumbling)
                    stop(cruise)
                    clf
                end
    
                pause(0.01)
    
    end

    if (2900 <= i) && (i < 3900) % Scene 4

            if i == 2900

                skybox_verts = [-sky_size -sky_size -100;sky_size -sky_size -100;sky_size -sky_size sky_size;-sky_size -sky_size sky_size;-sky_size sky_size sky_size;-sky_size sky_size -100;sky_size sky_size -100; sky_size sky_size sky_size];
                skybox_facets = [1 2 3 4;4 1 6 5;5 6 7 8;8 7 2 3;3 4 5 8];
                skyC = [1;1;9;9;9;1;1;9];
                        
                translate = [10 15 2000];
                translate2 = [-20 -30 -10];
                scale = 6.2;
                
                tomcat_main_verts = (tomcat_main.Points)*scale + translate;
                tomcat_left_verts = (tomcat_left.Points)*scale + translate;
                tomcat_right_verts = (tomcat_right.Points)*scale + translate;
                tomcat_cockpit_verts = (tomcat_cockpit.Points)*scale + translate;
                                
                tomcat2_main_verts = tomcat_main_verts + translate2;
                tomcat2_left_verts = tomcat_left_verts + translate2;
                tomcat2_right_verts = tomcat_right_verts + translate2;
                tomcat2_cockpit_verts = tomcat_cockpit_verts + translate2;
                        
                skybox = patch('Faces',skybox_facets,'Vertices',skybox_verts,'FaceVertexCData',skyC);
                hold on
                skybox.Clipping = 'off';
                skybox.FaceColor = 'interp';
                skybox.EdgeColor = 'none';
                skybox.FaceLighting = 'none';
                colormap('sky');
                axis equal
                material default
                campos([150 0 2000])
                camtarget([0 0 2000])
                camva(10)
                            
                tomcat_main_plot = patch('Faces',tomcat_main_facets,'Vertices',tomcat_main_verts);
                tomcat_main_plot.EdgeColor = 'none';
                tomcat_main_plot.FaceColor = grey;
                tomcat_main_plot.Clipping = 'off';
                tomcat_left_plot = patch('Faces',tomcat_left_facets,'Vertices',tomcat_left_verts);
                tomcat_left_plot.EdgeColor = 'none';
                tomcat_left_plot.FaceColor = grey;
                tomcat_left_plot.Clipping = 'off';
                tomcat_right_plot = patch('Faces',tomcat_right_facets,'Vertices',tomcat_right_verts);
                tomcat_right_plot.EdgeColor = 'none';
                tomcat_right_plot.FaceColor = grey;
                tomcat_right_plot.Clipping = 'off';
                tomcat_cockpit_plot = patch('Faces',tomcat_cockpit_facets,'Vertices',tomcat_cockpit_verts);
                tomcat_cockpit_plot.EdgeColor = 'none';
                tomcat_cockpit_plot.FaceColor = [0.7 0.7 1];
                tomcat_cockpit_plot.Clipping = 'off';
                                
                tomcat2_main_plot = patch('Faces',tomcat_main_facets,'Vertices',tomcat2_main_verts);
                tomcat2_main_plot.EdgeColor = 'none';
                tomcat2_main_plot.FaceColor = grey;
                tomcat2_main_plot.Clipping = 'off';
                tomcat2_left_plot = patch('Faces',tomcat_left_facets,'Vertices',tomcat2_left_verts);
                tomcat2_left_plot.EdgeColor = 'none';
                tomcat2_left_plot.FaceColor = grey;
                tomcat2_left_plot.Clipping = 'off';
                tomcat2_right_plot = patch('Faces',tomcat_right_facets,'Vertices',tomcat2_right_verts);
                tomcat2_right_plot.EdgeColor = 'none';
                tomcat2_right_plot.FaceColor = grey;
                tomcat2_right_plot.Clipping = 'off';
                tomcat2_cockpit_plot = patch('Faces',tomcat_cockpit_facets,'Vertices',tomcat2_cockpit_verts);
                tomcat2_cockpit_plot.EdgeColor = 'none';
                tomcat2_cockpit_plot.FaceColor = [0.7 0.7 1];
                tomcat2_cockpit_plot.Clipping = 'off';
                light('Style','Infinite','Position',[0 0 10000])
                axis equal
                
                play(cruise)
                play(rumbling)
                
             end
                
             translation_vec = [0 0.008*sin(0.02*i) 0.01*cos(0.02*i)];
             translation2_vec = [0 0.008*cos(0.02*i) 0.01*sin(0.02*i)];

             tomcat_main_verts = tomcat_main_verts + translation_vec;
             tomcat_left_verts = tomcat_left_verts + translation_vec;
             tomcat_right_verts = tomcat_right_verts + translation_vec;
             tomcat_cockpit_verts = tomcat_cockpit_verts + translation_vec;
             tomcat2_main_verts = tomcat2_main_verts + translation2_vec;
             tomcat2_left_verts = tomcat2_left_verts + translation2_vec;
             tomcat2_right_verts = tomcat2_right_verts + translation2_vec;
             tomcat2_cockpit_verts = tomcat2_cockpit_verts + translation2_vec;

             set(tomcat_main_plot,'Vertices',tomcat_main_verts);
             set(tomcat_left_plot,'Vertices',tomcat_left_verts);
             set(tomcat_right_plot,'Vertices',tomcat_right_verts);
             set(tomcat_cockpit_plot,'Vertices',tomcat_cockpit_verts);
             set(tomcat2_main_plot,'Vertices',tomcat2_main_verts);
             set(tomcat2_left_plot,'Vertices',tomcat2_left_verts);
             set(tomcat2_right_plot,'Vertices',tomcat2_right_verts);
             set(tomcat2_cockpit_plot,'Vertices',tomcat2_cockpit_verts);

             pause(0.01)

    end

    if (3900 <= i) && (i < 4100) % Scene 5

        tomcat1_main_verts = (tomcat_main.Points)*scale;
        tomcat1_left_verts = (tomcat_left.Points)*scale;
        tomcat1_right_verts = (tomcat_right.Points)*scale;
        tomcat1_cockpit_verts = (tomcat_cockpit.Points)*scale;

        mean_x = mean(tomcat_main_verts(:,1));
        mean_y = mean(tomcat_main_verts(:,2));
        mean_z = mean(tomcat_main_verts(:,3));
        mean2_x = mean(tomcat2_main_verts(:,1));
        mean2_y = mean(tomcat2_main_verts(:,2));
        mean2_z = mean(tomcat2_main_verts(:,3));

        origin_dist = [(mean_x + 1.8283) (mean_y + 5.1162*10^(-19)) (mean_z - 0.1186)];
        origin2_dist = [(mean2_x + 1.8283) (mean2_y + 5.1162*10^(-19)) (mean2_z - 0.1186)];

        angle = (1.63/1000)*(i-3910)^2 - (4.2/300000000)*(i-3910)^5;
        angle2 = (1.63/1000)*(i-3930)^2 - (4.2/300000000)*(i-3930)^5;
        rotation_mtx = [1 0 0;0 cos(angle) -sin(angle);0 sin(angle) cos(angle)];
        rotation2_mtx = [1 0 0;0 cos(angle2) -sin(angle2);0 sin(angle2) cos(angle2)];
        movement_vec = [0 0.04*(i-3910) -0.001*(i-3910)];
        movement_vec2 = [0 (0.04*(i-3910) - 1.5) (-0.001*(i-3910))];
        movement2_vec = [0 0.04*(i-3930) -0.001*(i-3930)];
        movement2_vec2 = [0 (0.04*(i-3930) - 1.5) (-0.001*(i-3930))];
        translation_vec = [0 0.008*sin(0.02*i) 0.01*cos(0.02*i)];
        translation2_vec = [0 0.008*cos(0.02*i) 0.01*sin(0.02*i)];

        if (3910 <= i) && (i < 3947) % Tomcat 1 roll

            tomcat3_main_verts = tomcat1_main_verts; % Translate to origin
            tomcat3_left_verts = tomcat1_left_verts;
            tomcat3_right_verts = tomcat1_right_verts;
            tomcat3_cockpit_verts = tomcat1_cockpit_verts;
            
            tomcat3_main_verts = tomcat3_main_verts*rotation_mtx; % Rotate
            tomcat3_left_verts = tomcat3_left_verts*rotation_mtx;
            tomcat3_right_verts = tomcat3_right_verts*rotation_mtx;
            tomcat3_cockpit_verts = tomcat3_cockpit_verts*rotation_mtx;
           
            tomcat3_main_verts = tomcat3_main_verts + origin_dist; % Translate back
            tomcat3_left_verts = tomcat3_left_verts + origin_dist;
            tomcat3_right_verts = tomcat3_right_verts + origin_dist;
            tomcat3_cockpit_verts = tomcat3_cockpit_verts + origin_dist;

        elseif i > 3947

            tomcat3_main_verts = tomcat3_main_verts + movement_vec2;
            tomcat3_left_verts = tomcat3_left_verts + movement_vec2;
            tomcat3_right_verts = tomcat3_right_verts + movement_vec2;
            tomcat3_cockpit_verts = tomcat3_cockpit_verts + movement_vec2;

        elseif i < 3910

            tomcat3_main_verts = tomcat_main_verts + translation_vec;
            tomcat3_left_verts = tomcat_left_verts + translation_vec;
            tomcat3_right_verts = tomcat_right_verts + translation_vec;
            tomcat3_cockpit_verts = tomcat_cockpit_verts + translation_vec;
         
        end

        if (3930 <= i) && (i <= 3967) % Tomcat 2 roll

            tomcat4_main_verts = tomcat1_main_verts;
            tomcat4_left_verts = tomcat1_left_verts;
            tomcat4_right_verts = tomcat1_right_verts;
            tomcat4_cockpit_verts = tomcat1_cockpit_verts;
    
            tomcat4_main_verts = tomcat4_main_verts*rotation2_mtx;
            tomcat4_left_verts = tomcat4_left_verts*rotation2_mtx;
            tomcat4_right_verts = tomcat4_right_verts*rotation2_mtx;
            tomcat4_cockpit_verts = tomcat4_cockpit_verts*rotation2_mtx;
    
            tomcat4_main_verts = tomcat4_main_verts + origin2_dist;
            tomcat4_left_verts = tomcat4_left_verts + origin2_dist;
            tomcat4_right_verts = tomcat4_right_verts + origin2_dist;
            tomcat4_cockpit_verts = tomcat4_cockpit_verts + origin2_dist;
    
        elseif i > 3967
    
            tomcat4_main_verts = tomcat4_main_verts + movement2_vec2;
            tomcat4_left_verts = tomcat4_left_verts + movement2_vec2;
            tomcat4_right_verts = tomcat4_right_verts + movement2_vec2;
            tomcat4_cockpit_verts = tomcat4_cockpit_verts + movement2_vec2;

        elseif i < 3930

            tomcat4_main_verts = tomcat2_main_verts + translation2_vec;
            tomcat4_left_verts = tomcat2_left_verts + translation2_vec;
            tomcat4_right_verts = tomcat2_right_verts + translation2_vec;
            tomcat4_cockpit_verts = tomcat2_cockpit_verts + translation2_vec;

        end

        set(tomcat_main_plot,'Vertices',tomcat3_main_verts)
        set(tomcat_left_plot,'Vertices',tomcat3_left_verts)
        set(tomcat_right_plot,'Vertices',tomcat3_right_verts)
        set(tomcat_cockpit_plot,'Vertices',tomcat3_cockpit_verts)

        set(tomcat2_main_plot,'Vertices',tomcat4_main_verts)
        set(tomcat2_left_plot,'Vertices',tomcat4_left_verts)
        set(tomcat2_right_plot,'Vertices',tomcat4_right_verts)
        set(tomcat2_cockpit_plot,'Vertices',tomcat4_cockpit_verts)

        if i == 4099
            clf
            stop(cruise)
            stop(rumbling)
        end

        if i == 3950

            play(rolling)

        end


        pause(0.01)

    end

    if (4100 <= i) && (i < 5100) % Scene 6

            if i == 4100
        
                sky_size = 100000;
                skybox_verts = [-sky_size -sky_size -100;sky_size -sky_size -100;sky_size -sky_size sky_size;-sky_size -sky_size sky_size;-sky_size sky_size sky_size;-sky_size sky_size -100;sky_size sky_size -100; sky_size sky_size sky_size];
                skybox_facets = [1 2 3 4;4 1 6 5;5 6 7 8;8 7 2 3;3 4 5 8];
                skyC = [1;1;9;9;9;1;1;9];
        
                rotx_mtx = [1 0 0;0 cos(pi/2.5) -sin(pi/2.5);0 sin(pi/2.5) cos(pi/2.5)];

                translate = [-1000 -1000 300];
                translate2 = [-20 -30 -5];
        
                tomcat_main_verts = ((tomcat_main.Points)*scale)*rotx_mtx;
                tomcat_left_verts = ((tomcat_left.Points)*scale)*rotx_mtx;
                tomcat_right_verts = ((tomcat_right.Points)*scale)*rotx_mtx;
                tomcat_cockpit_verts = ((tomcat_cockpit.Points)*scale)*rotx_mtx;
        
                tomcat2_main_verts = tomcat_main_verts + translate;
                tomcat2_left_verts = tomcat_left_verts + translate;
                tomcat2_right_verts = tomcat_right_verts + translate;
                tomcat2_cockpit_verts = tomcat_cockpit_verts + translate;
        
                tomcat3_main_verts = tomcat2_main_verts + translate2;
                tomcat3_left_verts = tomcat2_left_verts + translate2;
                tomcat3_right_verts = tomcat2_right_verts + translate2;
                tomcat3_cockpit_verts = tomcat2_cockpit_verts + translate2;
        
                tomcat_main_plot = patch('Faces',tomcat_main_facets,'Vertices',tomcat2_main_verts);
                hold on
                tomcat_main_plot.EdgeColor = 'none';
                tomcat_main_plot.FaceColor = grey;
                tomcat_main_plot.Clipping = 'off';
                tomcat_left_plot = patch('Faces',tomcat_left_facets,'Vertices',tomcat2_left_verts);
                tomcat_left_plot.EdgeColor = 'none';
                tomcat_left_plot.FaceColor = grey;
                tomcat_left_plot.Clipping = 'off';
                tomcat_right_plot = patch('Faces',tomcat_right_facets,'Vertices',tomcat2_right_verts);
                tomcat_right_plot.EdgeColor = 'none';
                tomcat_right_plot.FaceColor = grey;
                tomcat_right_plot.Clipping = 'off';
                tomcat_cockpit_plot = patch('Faces',tomcat_cockpit_facets,'Vertices',tomcat2_cockpit_verts);
                tomcat_cockpit_plot.EdgeColor = 'none';
                tomcat_cockpit_plot.FaceColor = [0.7 0.7 1];
                tomcat_cockpit_plot.Clipping = 'off';
                tomcat2_main_plot = patch('Faces',tomcat_main_facets,'Vertices',tomcat3_main_verts);
                tomcat2_main_plot.EdgeColor = 'none';
                tomcat2_main_plot.FaceColor = grey;
                tomcat2_main_plot.Clipping = 'off';
                tomcat2_left_plot = patch('Faces',tomcat_left_facets,'Vertices',tomcat3_left_verts);
                tomcat2_left_plot.EdgeColor = 'none';
                tomcat2_left_plot.FaceColor = grey;
                tomcat2_left_plot.Clipping = 'off';
                tomcat2_right_plot = patch('Faces',tomcat_right_facets,'Vertices',tomcat3_right_verts);
                tomcat2_right_plot.EdgeColor = 'none';
                tomcat2_right_plot.FaceColor = grey;
                tomcat2_right_plot.Clipping = 'off';
                tomcat2_cockpit_plot = patch('Faces',tomcat_cockpit_facets,'Vertices',tomcat3_cockpit_verts);
                tomcat2_cockpit_plot.EdgeColor = 'none';
                tomcat2_cockpit_plot.FaceColor = [0.7 0.7 1];
                tomcat2_cockpit_plot.Clipping = 'off';
        
                skybox = patch('Faces',skybox_facets,'Vertices',(skybox_verts + [5000 0 0]),'FaceVertexCData',skyC);
                skybox.Clipping = 'off';
                skybox.FaceColor = 'interp';
                skybox.EdgeColor = 'none';
                skybox.FaceLighting = 'none';
                colormap('sky');
        
                material default
                light('Position',[0 0 1000])
                xlabel('x')
                ylabel('y')
                zlabel('z')
                axis equal
                set(gca,'Visible','off')
        
            end
        
            angle = (-pi/5)*(tanh(0.03*(i - 4450))) - pi/5;
            angle2 = ((-2*pi - pi/2.5)*tanh(0.01*(i - 4450)) + (-2*pi - pi/2.5))/2;
            rotz_mtx = [cos(angle) -sin(angle) 0;sin(angle) cos(angle) 0;0 0 1];
            rotx_mtx = [1 0 0;0 cos(angle) -sin(angle);0 sin(angle) cos(angle)];
            rotx_mtx2 = [1 0 0;0 cos(angle2) -sin(angle2);0 sin(angle2) cos(angle2)];
            movement_vec = [10 0 0];
        
            if i >= 4101
        
                tomcat2_main_verts = tomcat_main_verts; % Define verts @ origin
                tomcat2_left_verts = tomcat_left_verts;
                tomcat2_right_verts = tomcat_right_verts;
                tomcat2_cockpit_verts = tomcat_cockpit_verts;
        
                tomcat2_main_verts = tomcat2_main_verts*rotx_mtx; % Rotate
                tomcat2_left_verts = tomcat2_left_verts*rotx_mtx;
                tomcat2_right_verts = tomcat2_right_verts*rotx_mtx;
                tomcat2_cockpit_verts = tomcat2_cockpit_verts*rotx_mtx;
        
                tomcat2_main_verts = tomcat2_main_verts + translate; % Translate back
                tomcat2_left_verts = tomcat2_left_verts + translate;
                tomcat2_right_verts = tomcat2_right_verts + translate;
                tomcat2_cockpit_verts = tomcat2_cockpit_verts + translate;
        
                tomcat3_main_verts = tomcat_main_verts;
                tomcat3_left_verts = tomcat_left_verts;
                tomcat3_right_verts = tomcat_right_verts;
                tomcat3_cockpit_verts = tomcat_cockpit_verts;
        
                tomcat3_main_verts = tomcat3_main_verts*rotx_mtx2;
                tomcat3_left_verts = tomcat3_left_verts*rotx_mtx2;
                tomcat3_right_verts = tomcat3_right_verts*rotx_mtx2;
                tomcat3_cockpit_verts = tomcat3_cockpit_verts*rotx_mtx2;
        
                tomcat3_main_verts = tomcat3_main_verts + translate2;
                tomcat3_left_verts = tomcat3_left_verts + translate2;
                tomcat3_right_verts = tomcat3_right_verts + translate2;
                tomcat3_cockpit_verts = tomcat3_cockpit_verts + translate2;
        
            end
        
            tomcat2_main_verts = tomcat2_main_verts + movement_vec;
            tomcat2_left_verts = tomcat2_left_verts + movement_vec;
            tomcat2_right_verts = tomcat2_right_verts + movement_vec;
            tomcat2_cockpit_verts = tomcat2_cockpit_verts + movement_vec;
        
            tomcat3_main_verts = tomcat3_main_verts + movement_vec;
            tomcat3_left_verts = tomcat3_left_verts + movement_vec;
            tomcat3_right_verts = tomcat3_right_verts + movement_vec;
            tomcat3_cockpit_verts = tomcat3_cockpit_verts + movement_vec;
        
            mean_x = mean(tomcat2_main_verts(:,1));
            mean_y = mean(tomcat2_main_verts(:,2));
            mean_z = mean(tomcat2_main_verts(:,3));
        
            mean2_x = mean(tomcat3_main_verts(:,1));
            mean2_y = mean(tomcat3_main_verts(:,2));
            mean2_z = mean(tomcat3_main_verts(:,3));
        
            translate2 = [(mean2_x + 1.8283) (mean2_y + 5.1162*10^(-19)) (mean2_z - 0.1186)];
            translate = [(mean_x + 1.8283) (mean_y + 5.1162*10^(-19)) (mean_z - 0.1186)];
        
            set(tomcat_main_plot,'Vertices',tomcat2_main_verts);
            set(tomcat_left_plot,'Vertices',tomcat2_left_verts);
            set(tomcat_right_plot,'Vertices',tomcat2_right_verts);
            set(tomcat_cockpit_plot,'Vertices',tomcat2_cockpit_verts);
            set(tomcat2_main_plot,'Vertices',tomcat3_main_verts);
            set(tomcat2_left_plot,'Vertices',tomcat3_left_verts);
            set(tomcat2_right_plot,'Vertices',tomcat3_right_verts);
            set(tomcat2_cockpit_plot,'Vertices',tomcat3_cockpit_verts);
        
            campos([4000 -900 100])
            camtarget([(mean_x + mean2_x)/2 (mean_y + mean2_y)/2 (mean_z + mean2_z)/2])
            camva(10)
        
            if i == 4300
                play(flyby2)
            end

            if i == 5099
                clf
            end
        
            pause(0.01)

    end

    if (5100 <= i) && (i < 6100)

            if i == 5100

                speed = 1.5;
                flame_alpha = 0;
        
                translate = [0 20 0];
                translate2 = [-20 -30 -5];
                scale = 6.2;
                scale_flame = 0;
                aspect_ratio = 16/9;
                grey = [0.8 0.8 0.8];
                
                tomcat_main_verts = ((tomcat_main.Points)*scale) + translate;
                tomcat_left_verts = ((tomcat_left.Points)*scale) + translate;
                tomcat_right_verts = ((tomcat_right.Points)*scale) + translate;
                tomcat_cockpit_verts = ((tomcat_cockpit.Points)*scale) + translate;
                tomcat_flame_verts = ((tomcat_flame.Points)*scale) + translate;
                
                tomcat2_main_verts = tomcat_main_verts + translate2;
                tomcat2_left_verts = tomcat_left_verts + translate2;
                tomcat2_right_verts = tomcat_right_verts + translate2;
                tomcat2_cockpit_verts = tomcat_cockpit_verts + translate2;
                tomcat2_flame_verts = tomcat_flame_verts + translate2;
        
                [ocean_x,ocean_y] = meshgrid(0:1:159,-39.5:1:39.5);
                wave_height = zeros(size(ocean_x));
        
                tomcat_main_plot = patch('Faces',tomcat_main_facets,'Vertices',tomcat_main_verts);
                hold on
                tomcat_main_plot.EdgeColor = 'none';
                tomcat_main_plot.FaceColor = grey;
                tomcat_main_plot.Clipping = 'off';
                tomcat_left_plot = patch('Faces',tomcat_left_facets,'Vertices',tomcat_left_verts);
                tomcat_left_plot.EdgeColor = 'none';
                tomcat_left_plot.FaceColor = grey;
                tomcat_left_plot.Clipping = 'off';
                tomcat_right_plot = patch('Faces',tomcat_right_facets,'Vertices',tomcat_right_verts);
                tomcat_right_plot.EdgeColor = 'none';
                tomcat_right_plot.FaceColor = grey;
                tomcat_right_plot.Clipping = 'off';
                tomcat_cockpit_plot = patch('Faces',tomcat_cockpit_facets,'Vertices',tomcat_cockpit_verts);
                tomcat_cockpit_plot.EdgeColor = 'none';
                tomcat_cockpit_plot.FaceColor = [0.7 0.7 1];
                tomcat_cockpit_plot.Clipping = 'off';
                tomcat_flame_plot = patch('Faces',tomcat_flame_facets,'Vertices',tomcat_flame_verts);
                tomcat_flame_plot.EdgeColor = 'none';
                tomcat_flame_plot.FaceColor = [1 0.7 0.7];
                tomcat_flame_plot.Clipping = 'off';
                tomcat2_main_plot = patch('Faces',tomcat_main_facets,'Vertices',tomcat2_main_verts);
                tomcat2_main_plot.EdgeColor = 'none';
                tomcat2_main_plot.FaceColor = grey;
                tomcat2_main_plot.Clipping = 'off';
                tomcat2_left_plot = patch('Faces',tomcat_left_facets,'Vertices',tomcat2_left_verts);
                tomcat2_left_plot.EdgeColor = 'none';
                tomcat2_left_plot.FaceColor = grey;
                tomcat2_left_plot.Clipping = 'off';
                tomcat2_right_plot = patch('Faces',tomcat_right_facets,'Vertices',tomcat2_right_verts);
                tomcat2_right_plot.EdgeColor = 'none';
                tomcat2_right_plot.FaceColor = grey;
                tomcat2_right_plot.Clipping = 'off';
                tomcat2_cockpit_plot = patch('Faces',tomcat_cockpit_facets,'Vertices',tomcat2_cockpit_verts);
                tomcat2_cockpit_plot.EdgeColor = 'none';
                tomcat2_cockpit_plot.FaceColor = [0.7 0.7 1];
                tomcat2_cockpit_plot.Clipping = 'off';
                tomcat2_flame_plot = patch('Faces',tomcat_flame_facets,'Vertices',tomcat2_flame_verts);
                tomcat2_flame_plot.EdgeColor = 'none';
                tomcat2_flame_plot.FaceColor = [1 0.7 0.7];
                tomcat2_flame_plot.Clipping = 'off';
        
                ocean = surf(ocean_x,ocean_y,wave_height);
                ocean.Clipping = 'off';
                ocean.FaceColor = [0 0.1 0.6];
                ocean.EdgeColor = 'none';
                ocean.FaceAlpha = 0.7;
                ocean.FaceLighting = 'phong';
        
                material default
                light
                xlabel('x')
                ylabel('y')
                zlabel('z')
                axis equal
                set(gca,'Visible','on')
        
                meanx_left = mean(tomcat_left_verts(:,1)) + 1.8355;
                meany_left = mean(tomcat_left_verts(:,2)) - 4.5550;
                meanz_left = mean(tomcat_left_verts(:,2)) - 0.5983;
                translate_left = [meanx_left meany_left meanz_left];
            
                meanx2_left = mean(tomcat2_left_verts(:,1)) + 1.8355;
                meany2_left = mean(tomcat2_left_verts(:,2)) - 4.5550;
                meanz2_left = mean(tomcat2_left_verts(:,2)) - 0.5983;
                translate2_left = [meanx2_left meany2_left meanz2_left];
        
                meanx_right = mean(tomcat_right_verts(:,1)) + 1.8355;
                meany_right = mean(tomcat_right_verts(:,2)) + 4.5352;
                meanz_right = mean(tomcat_right_verts(:,2)) - 0.5983;
                translate_right = [meanx_right meany_right meanz_right];
            
                meanx2_right = mean(tomcat2_right_verts(:,1)) + 1.8355;
                meany2_right = mean(tomcat2_right_verts(:,2)) + 4.5352;
                meanz2_right = mean(tomcat2_right_verts(:,2)) - 0.5983;
                translate2_right = [meanx2_right meany2_right meanz2_right];
        
            end
        
            if (5400 <= i) && (i <= 5475)
        
                movement_vec = [speed+0.04*sin(0.02*i) 0.04*cos(0.04*i) 0];
                movement_vec2 = [speed+0.04*cos(0.02*i) 0.04*sin(0.04*i) 0];
        
                angle = -0.01;
                angle2 = -angle;
                rotz_mtx = [cos(angle) -sin(angle) 0;sin(angle) cos(angle) 0;0 0 1];
                rotz2_mtx = [cos(angle2) -sin(angle2) 0;sin(angle2) cos(angle2) 0;0 0 1];
        
                tomcat_left_verts = tomcat_left_verts - translate_left; % move to origin
                tomcat_right_verts = tomcat_right_verts - translate_right;
                tomcat2_left_verts = tomcat2_left_verts - translate2_left;
                tomcat2_right_verts = tomcat2_right_verts - translate2_right;
        
                tomcat_left_verts = tomcat_left_verts*rotz_mtx; % rotate
                tomcat_right_verts = tomcat_right_verts*rotz2_mtx;
                tomcat2_left_verts = tomcat2_left_verts*rotz_mtx;
                tomcat2_right_verts = tomcat2_right_verts*rotz2_mtx;
        
                tomcat_left_verts = tomcat_left_verts + translate_left; % move back
                tomcat_right_verts = tomcat_right_verts + translate_right;
                tomcat2_left_verts = tomcat2_left_verts + translate2_left;
                tomcat2_right_verts = tomcat2_right_verts + translate2_right;
        
            end
            
            if i < 5400
        
               movement_vec = [speed+0.04*sin(0.02*i) 0.04*cos(0.04*i) 0];
               movement_vec2 = [speed+0.04*cos(0.02*i) 0.04*sin(0.04*i) 0];
        
            end
        
            if i > 5475
        
               movement_vec = [3*tanh(0.01*(i-5520))+3 0.04*cos(0.04*i) 0];
               movement_vec2 = [3*tanh(0.01*(i-5520))+3 0.04*sin(0.04*i) 0];
        
               flame_alpha = 0.9;
               
            end
        
            meanx_left = mean(tomcat_left_verts(:,1)) + 2.8355;
            meany_left = mean(tomcat_left_verts(:,2)) - 1.5550;
            meanz_left = mean(tomcat_left_verts(:,2)) - 0.5983;
            translate_left = [meanx_left meany_left meanz_left];
        
            meanx2_left = mean(tomcat2_left_verts(:,1)) + 2.8355;
            meany2_left = mean(tomcat2_left_verts(:,2)) - 1.5550;
            meanz2_left = mean(tomcat2_left_verts(:,2)) - 0.5983;
            translate2_left = [meanx2_left meany2_left meanz2_left];
        
            meanx_right = mean(tomcat_right_verts(:,1)) + 2.8355;
            meany_right = mean(tomcat_right_verts(:,2)) + 1.5352;
            meanz_right = mean(tomcat_right_verts(:,2)) - 0.5983;
            translate_right = [meanx_right meany_right meanz_right];
        
            meanx2_right = mean(tomcat2_right_verts(:,1)) + 2.8355;
            meany2_right = mean(tomcat2_right_verts(:,2)) + 1.5352;
            meanz2_right = mean(tomcat2_right_verts(:,2)) - 0.5983;
            translate2_right = [meanx2_right meany2_right meanz2_right];
        
            tomcat_main_verts = tomcat_main_verts + movement_vec; 
            tomcat_left_verts = tomcat_left_verts + movement_vec;
            tomcat_right_verts = tomcat_right_verts + movement_vec;
            tomcat_cockpit_verts = tomcat_cockpit_verts + movement_vec;
            tomcat_flame_verts = tomcat_flame_verts + movement_vec;
           
            tomcat2_main_verts = tomcat2_main_verts + movement_vec2;
            tomcat2_left_verts = tomcat2_left_verts + movement_vec2;
            tomcat2_right_verts = tomcat2_right_verts + movement_vec2;
            tomcat2_cockpit_verts = tomcat2_cockpit_verts + movement_vec2;
            tomcat2_flame_verts = tomcat2_flame_verts + movement_vec2;
        
            set(tomcat_main_plot,'Vertices',tomcat_main_verts);
            set(tomcat_left_plot,'Vertices',tomcat_left_verts);
            set(tomcat_right_plot,'Vertices',tomcat_right_verts);
            set(tomcat_cockpit_plot,'Vertices',tomcat_cockpit_verts);
            set(tomcat_flame_plot,'Vertices',tomcat_flame_verts,'FaceAlpha',flame_alpha);
            set(tomcat2_main_plot,'Vertices',tomcat2_main_verts);
            set(tomcat2_left_plot,'Vertices',tomcat2_left_verts);
            set(tomcat2_right_plot,'Vertices',tomcat2_right_verts);
            set(tomcat2_cockpit_plot,'Vertices',tomcat2_cockpit_verts);
            set(tomcat2_flame_plot,'Vertices',tomcat2_flame_verts,'FaceAlpha',flame_alpha);
        
            meanx_main = mean(tomcat_main_verts(:,1));
            meany_main = mean(tomcat_main_verts(:,2));
            meanz_main = mean(tomcat_main_verts(:,3));
        
            meanx2_main = mean(tomcat2_main_verts(:,1));
            meany2_main = mean(tomcat2_main_verts(:,2));
            meanz2_main = mean(tomcat2_main_verts(:,3));
        
            [ocean_x,ocean_y] = meshgrid((speed*(i-5100) - 79.5):1:(speed*(i-5100) + 79.5),(speed*(i-5100) - 39.5):1:(speed*(i-5100) + 39.5)); 
            wave_1 = 0.6*exp(sin(0.2*ocean_x + -1.4*ocean_y + 0.02*i));
            wave_2 = 0.5*exp(sin(1.2*ocean_x + -1.6*ocean_y + 0.02*i));
            wave_3 = 0.2*exp(sin(1.6*ocean_x + -0.8*ocean_y + 0.05*i));
            wave_height = ((wave_1 + wave_2 + wave_3) - 30);
            ocean.XData = ocean_x;
            ocean.ZData = wave_height;
        
            camtarget([speed*(i-5100) (meany_main + meany2_main)/2 (meanz_main + meanz2_main)/2])
            campos([speed*(i-5100) ((meany_main + meany2_main)/2)+50 ((meanz_main + meanz2_main)/2)+100])
            camva(20)

            if i == 5350
                play(servo)
            end
        
            if i == 5410
                play(afterburner)
            end
        
            if i == 5100
                play(cruise)
                play(rumbling)
            end
        
            if i == 5460
                stop(cruise)
            end
        
            pause(0.01)

            if i == 6099
                stop(dangerzone)
                stop(rumbling)
            end

    end

end