library(anim.plots)


### Name: anim.save
### Title: Save an anim.frames object in various formats.
### Aliases: anim.save

### ** Examples


## Not run: 
##D tmp <- anim.plot(1:10, 1:10, pch=1:10, show=FALSE)
##D anim.save(tmp, "mygif.gif")
##D 
##D anim.save(replay(tmp, after=legend("topleft", legend="My legend")), 
##D    "mygif2.gif")
## End(Not run)




