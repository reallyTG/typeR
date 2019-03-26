library(spatstat)


### Name: applynbd
### Title: Apply Function to Every Neighbourhood in a Point Pattern
### Aliases: applynbd
### Keywords: spatial programming iteration

### ** Examples

  redwood
  # count the number of points within radius 0.2 of each point of X
  nneighbours <- applynbd(redwood, R=0.2, function(Y, ...){npoints(Y)-1})
  # equivalent to:
  nneighbours <- applynbd(redwood, R=0.2, function(Y, ...){npoints(Y)}, exclude=TRUE)

  # compute the distance to the second nearest neighbour of each point
  secondnndist <- applynbd(redwood, N = 2,
                           function(dists, ...){max(dists)},
                           exclude=TRUE)

  # marked point pattern
  trees <- longleaf
  ## Don't show: 
	# smaller dataset
	trees <- trees[seq(1, npoints(trees), by=80)]
  
## End(Don't show)
  # compute the median of the marks of all neighbours of a point
  # (see also 'markstat')
  dbh.med <- applynbd(trees, R=90, exclude=TRUE,
                 function(Y, ...) { median(marks(Y))})


  # ANIMATION explaining the definition of the K function
  # (arguments `fullpicture' and 'rad' are passed to FUN)

  if(interactive()) {
  showoffK <- function(Y, current, dists, dranks, fullpicture,rad) { 
	plot(fullpicture, main="")
	points(Y, cex=2)
        ux <- current[["x"]]
        uy <- current[["y"]]
	points(ux, uy, pch="+",cex=3)
	theta <- seq(0,2*pi,length=100)
	polygon(ux + rad * cos(theta), uy+rad*sin(theta))
	text(ux + rad/3, uy + rad/2,npoints(Y),cex=3)
	if(interactive()) Sys.sleep(if(runif(1) < 0.1) 1.5 else 0.3)
	return(npoints(Y))
  }
  applynbd(redwood, R=0.2, showoffK, fullpicture=redwood, rad=0.2, exclude=TRUE)

  # animation explaining the definition of the G function

  showoffG <- function(Y, current, dists, dranks, fullpicture) { 
	plot(fullpicture, main="")
	points(Y, cex=2)
        u <- current
	points(u[1],u[2],pch="+",cex=3)
	v <- c(Y$x[1],Y$y[1])
	segments(u[1],u[2],v[1],v[2],lwd=2)
	w <- (u + v)/2
	nnd <- dists[1]
	text(w[1],w[2],round(nnd,3),cex=2)
	if(interactive()) Sys.sleep(if(runif(1) < 0.1) 1.5 else 0.3)
	return(nnd)
  }

  applynbd(cells, N=1, showoffG, exclude=TRUE, fullpicture=cells)
  }



