library(rgl)


### Name: spin3d
### Title: Create a function to spin a scene at a fixed rate
### Aliases: spin3d
### Keywords: dplot

### ** Examples

# Spin one object
open3d()
plot3d(oh3d(col = "lightblue", alpha = 0.5))
if (!rgl.useNULL())
  play3d(spin3d(axis = c(1, 0, 0), rpm = 30), duration = 2)

# Show spinning sprites, and rotate the whole view
open3d()
spriteid <- NULL

spin1 <- spin3d(rpm = 4.5 ) # the scene spinner
spin2 <- spin3d(rpm = 9 ) # the sprite spinner

f <- function(time) {
    par3d(skipRedraw = TRUE) # stops intermediate redraws
    on.exit(par3d(skipRedraw = FALSE)) # redraw at the end

    rgl.pop(id = spriteid) # delete the old sprite
    cubeid <- shade3d(cube3d(), col = "red")
    spriteid <<- sprites3d(0:1, 0:1, 0:1, shape = cubeid,
                   userMatrix = spin2(time, 
                     base = spin1(time)$userMatrix)$userMatrix)
    spin1(time)
}
if (!rgl.useNULL())
  play3d(f, duration = 2)



