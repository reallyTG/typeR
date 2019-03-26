library(spatstat)


### Name: Extract.ppp
### Title: Extract or Replace Subset of Point Pattern
### Aliases: [.ppp [<-.ppp
### Keywords: spatial manip

### ** Examples

 # Longleaf pines data
 lon <- longleaf
 ## Not run: 
##D  plot(lon)
##D  
## End(Not run)
 ## Don't show: 
lon <- lon[seq(1,npoints(lon),by=10)]
## End(Don't show)

 # adult trees defined to have diameter at least 30 cm
 longadult <- subset(lon, marks >= 30)
 ## Not run: 
##D  plot(longadult)
##D  
## End(Not run)
 # note that the marks are still retained.
 # Use unmark(longadult) to remove the marks
 
 # New Zealand trees data
 ## Not run: 
##D  plot(nztrees)          # plot shows a line of trees at the far right
##D  abline(v=148, lty=2)   # cut along this line
##D  
## End(Not run)
 nzw <- owin(c(0,148),c(0,95)) # the subwindow
 # trim dataset to this subwindow
 nzsub <- nztrees[nzw]
 ## Not run: 
##D  plot(nzsub)
##D  
## End(Not run)

 # Redwood data
 ## Not run: 
##D  plot(redwood)
##D  
## End(Not run)
 # Random thinning: delete 60% of data
 retain <- (runif(npoints(redwood)) < 0.4)
 thinred <- redwood[retain]
 ## Not run: 
##D  plot(thinred)
##D  
## End(Not run)

 # Scramble 60% of data
 X <- redwood
 modif <- (runif(npoints(X)) < 0.6)
 X[modif] <- runifpoint(ex=X[modif])

 # Lansing woods data - multitype points
 lan <- lansing
 ## Don't show: 
    lan <- lan[seq(1, npoints(lan), length=100)]
 
## End(Don't show)

 # Hickory trees
  hicks <- split(lansing)$hickory

 # Trees in subwindow
  win <- owin(c(0.3, 0.6),c(0.2, 0.5))
  lsub <- lan[win]

 # Scramble the locations of trees in subwindow, retaining their marks
  lan[win] <- runifpoint(ex=lsub) %mark% marks(lsub)

 # Extract oaks only
 oaknames <- c("redoak", "whiteoak", "blackoak")
 oak <- lan[marks(lan) %in% oaknames, drop=TRUE]
 oak <- subset(lan, marks %in% oaknames, drop=TRUE)

 # To clip or not to clip
 X <- runifpoint(25, letterR)
 B <- owin(c(2.2, 3.9), c(2, 3.5))
 opa <- par(mfrow=c(1,2))
 plot(X, main="X[B]")
 plot(X[B], border="red", cols="red", add=TRUE, show.all=TRUE, main="")
 plot(X, main="X[B, clip=TRUE]")
 plot(B, add=TRUE, lty=2)
 plot(X[B, clip=TRUE], border="blue", cols="blue", add=TRUE,
      show.all=TRUE, main="")
 par(opa)



