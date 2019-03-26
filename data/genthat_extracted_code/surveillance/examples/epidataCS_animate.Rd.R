library(surveillance)


### Name: epidataCS_animate
### Title: Spatio-Temporal Animation of a Continuous-Time Continuous-Space
###   Epidemic
### Aliases: animate.epidataCS
### Keywords: hplot dynamic spatial

### ** Examples

data("imdepi")
imdepiB <- subset(imdepi, type == "B")

## Not run: 
##D # Animate the first year of type B with a step size of 7 days
##D animate(imdepiB, interval=c(0,365), time.spacing=7, nmax=Inf, sleep=0.1)
##D 
##D # Sequential animation of type B events during the first year
##D animate(imdepiB, interval=c(0,365), time.spacing=NULL, sleep=0.1)
##D 
##D # Animate the whole time range but with nmax=20 snapshots only
##D animate(imdepiB, time.spacing=NA, nmax=20, sleep=0.1)
## End(Not run)

# Such an animation can be saved in various ways using the tools of
# the animation package, e.g., saveHTML()
if (require("animation")) {
  oldwd <- setwd(tempdir())  # to not clutter up the current working dir
  saveHTML(animate(imdepiB, interval = c(0,365), time.spacing = 7),
           nmax = Inf, interval = 0.2, loop = FALSE,
           title = "Animation of the first year of type B events")
  setwd(oldwd)
}



