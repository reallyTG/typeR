library(rgl)


### Name: light
### Title: add light source
### Aliases: rgl.light light3d
### Keywords: dynamic

### ** Examples


#
# a lightsource moving through the scene
#
data(volcano)
z <- 2 * volcano # Exaggerate the relief
x <- 10 * (1:nrow(z)) # 10 meter spacing (S to N)
y <- 10 * (1:ncol(z)) # 10 meter spacing (E to W)
zlim <- range(z)
zlen <- zlim[2] - zlim[1] + 1
colorlut <- terrain.colors(zlen) # height color lookup table
col <- colorlut[ z - zlim[1] + 1 ] # assign colors to heights for each point

open3d()
bg3d("gray50")
surface3d(x, y, z, color = col, back = "lines")
r <- max(y) - mean(y)
lightid <- spheres3d(1, 1, 1, alpha = 0)
frame <- function(time) {
    a <- pi*(time - 1)
    save <- par3d(skipRedraw = TRUE)
    clear3d(type = "lights")
    rgl.pop(id = lightid)
    xyz <- matrix(c(r*sin(a) + mean(x), r*cos(a) + mean(y), max(z)), ncol = 3)
    light3d(x = xyz, diffuse = "gray75", 
            specular = "gray75", viewpoint.rel = FALSE) 
    light3d(diffuse = "gray10", specular = "gray25")
    lightid <<- spheres3d(xyz, emission = "white", radius = 4)
    par3d(save)
    Sys.sleep(0.02)
    NULL
}
play3d(frame, duration = 2)



