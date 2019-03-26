library(surveillance)


### Name: epidata_animate
### Title: Spatio-Temporal Animation of an Epidemic
### Aliases: animate.epidata animate.summary.epidata
### Keywords: hplot dynamic spatial

### ** Examples

data("fooepidata")
(s <- summary(fooepidata))

# plot the ordering of the events only
animate(s, sleep=0.01)   # or: animate(fooepidata)

# with timer (animate only up to t=10)
animate(s, time.spacing=0.1, end=10, sleep=0.01)

# Such an animation can be saved in various ways using tools of
# the animation package, e.g., saveHTML()
if (interactive() && require("animation")) {
  oldwd <- setwd(tempdir())  # to not clutter up the current working dir
  saveHTML({
    par(bg="white")  # default "transparent" is grey in some browsers
    animate(s, time.spacing=1, sleep=0, generate.snapshots="epiani")
  }, use.dev=FALSE, img.name="epiani", ani.width=600, interval=0.5)
  setwd(oldwd)
}



