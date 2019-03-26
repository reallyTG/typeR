library(geophys)


### Name: stress
### Title: Stress Box
### Aliases: stress
### Keywords: misc

### ** Examples


## Not run: 
##D #####   no stress tensor provided => no mohr's circle
##D stress()
##D 
##D #########################  run program with a stress tensor
##D Stensor = matrix(c(
##D 15, 0, 0,
##D 0, 10, 0,
##D 0,  0, 5), ncol=3)
##D 
##D 
##D stress(Stensor=Stensor)
##D 
##D P1 = c(0.2, 1, 1, 0)
##D P2 = c(1, 0.1, 1, 0)
##D P3 = c(1, 1, 0.4, 0)
##D 
##D   S = stressSETUP(P1, P2, P3, xscale=30   )
##D 
##D stress(PPs = S$PPs, Rview =S$Rview,
##D      xscale = S$xscale, Stensor=Stensor )
##D 
##D 
##D 
##D 
## End(Not run)





