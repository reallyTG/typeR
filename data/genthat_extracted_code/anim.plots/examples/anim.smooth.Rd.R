library(anim.plots)


### Name: anim.smooth
### Title: Smooth an 'anim.frames' object
### Aliases: anim.smooth

### ** Examples

accel <- anim.plot(1, 1:30, times=sqrt(1:30))
## Not run: 
##D anim.save(accel, "GIF", "wrong.gif")
## End(Not run)
accel <- anim.smooth(accel, fps=20)
## Not run: 
##D anim.save(accel, "GIF", "better.gif")
## End(Not run)



