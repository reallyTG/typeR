library(misc3d)


### Name: parametric3d
### Title: Draw a 3D Parametric Plot
### Aliases: parametric3d
### Keywords: hplot

### ** Examples

  #Example 1: Ratio-of-Uniform sampling region of bivariate normal
  parametric3d(fx = function(u, v) u * exp(-0.5 * (u^2 + v^2 -
                      2 * 0.75 * u * v)/sqrt(1-.75^2))^(1/3),
               fy = function(u, v) v * exp(-0.5 * (u^2 + v^2 -
                      2 * 0.75 * u * v)/sqrt(1-.75^2))^(1/3),
               fz = function(u, v) exp(-0.5 * (u^2 + v^2 - 2 * 0.75 * u * 
                      v)/sqrt(1-.75^2))^(1/3),
               umin = -20, umax = 20, vmin = -20, vmax = 20, 
               n = 100)	
  parametric3d(fx = function(u, v) u * exp(-0.5 * (u^2 + v^2 -
                      2 * 0.75 * u * v)/sqrt(1-.75^2))^(1/3),
               fy = function(u, v) v * exp(-0.5 * (u^2 + v^2 -
                      2 * 0.75 * u * v)/sqrt(1-.75^2))^(1/3),
               fz = function(u, v) exp(-0.5 * (u^2 + v^2 - 2 * 0.75 * u * 
                      v)/sqrt(1-.75^2))^(1/3),
               u = qcauchy((1:100)/101), v = qcauchy((1:100)/101))	
  parametric3d(fx = function(u, v) u * exp(-0.5 * (u^2 + v^2 -
                      2 * 0.75 * u * v)/sqrt(1-.75^2))^(1/3),
               fy = function(u, v) v * exp(-0.5 * (u^2 + v^2 -
                      2 * 0.75 * u * v)/sqrt(1-.75^2))^(1/3),
               fz = function(u, v) exp(-0.5 * (u^2 + v^2 - 2 * 0.75 * u * 
                      v)/sqrt(1-.75^2))^(1/3),
               u = qcauchy((1:100)/101), v = qcauchy((1:100)/101),
               engine = "standard", scale = FALSE, screen = list(x=-90, y=20))

  #Example 2: Ratio-of-Uniform sampling region of Bivariate t      
  parametric3d(fx = function(u,v) u*(dt(u,2) * dt(v,2))^(1/3), 
               fy = function(u,v) v*(dt(u,2) * dt(v,2))^(1/3),
               fz = function(u,v) (dt(u,2) * dt(v,2))^(1/3), 
               umin = -20, umax = 20, vmin = -20, vmax = 20, 
               n = 100, color = "green")
  parametric3d(fx = function(u,v) u*(dt(u,2) * dt(v,2))^(1/3),
               fy = function(u,v) v*(dt(u,2) * dt(v,2))^(1/3),
               fz = function(u,v) (dt(u,2) * dt(v,2))^(1/3),
               u = qcauchy((1:100)/101), v = qcauchy((1:100)/101),
               color = "green")
  parametric3d(fx = function(u,v) u*(dt(u,2) * dt(v,2))^(1/3),
               fy = function(u,v) v*(dt(u,2) * dt(v,2))^(1/3),
               fz = function(u,v) (dt(u,2) * dt(v,2))^(1/3),
               u = qcauchy((1:100)/101), v = qcauchy((1:100)/101),
               color = "green", engine = "standard", scale = FALSE)


  #Example 3: Surface of revolution
  parametric3d(fx = function(u,v) u,
               fy = function(u,v) sin(v)*(u^3+2*u^2-2*u+2)/5,
               fz = function(u,v) cos(v)*(u^3+2*u^2-2*u+2)/5,
               umin = -2.3, umax = 1.3, vmin = 0, vmax = 2*pi)
  parametric3d(fx = function(u,v) u,
               fy = function(u,v) sin(v)*(u^3+2*u^2-2*u+2)/5,
               fz = function(u,v) cos(v)*(u^3+2*u^2-2*u+2)/5,
               umin = -2.3, umax = 1.3, vmin = 0, vmax = 2*pi,
               engine = "standard", scale = FALSE,
               color = "red", color2 = "blue", material = "shiny")




