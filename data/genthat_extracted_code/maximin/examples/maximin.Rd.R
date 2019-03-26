library(maximin)


### Name: maximin
### Title: Space-filling design under the criterion of maximin distance
### Aliases: maximin maximin.cand
### Keywords: space-filling design computer experiment maximin

### ** Examples

   
 ## Not run: 
##D    ## maximin.cand
##D    # a generic function to expand grids at higher dimension
##D    expand.grids <- function(x,d) expand.grid(replicate(d, x, simplify=FALSE))
##D    
##D    # generate the design
##D    library(lhs)
##D    n <- 100
##D    p <- 2
##D    Xorig <- randomLHS(10, p)
##D    x1 <- seq(0, 1, length.out=n)
##D    Xcand <- expand.grids(x1, p)
##D    names(Xcand) <- paste0("x", 1:2)
##D    T <- nrow(Xcand)
##D    Xsparse <- maximin.cand(n=n, Xcand=Xcand, Tmax=T, Xorig=Xorig, 
##D                            init=NULL, verb=FALSE, tempfile=NULL)
##D    
##D    maxmd <- as.numeric(format(round(max(na.omit(Xsparse$mis)), 5), nsmall=5))
##D    
##D    # visualization
##D    par(mfrow=c(1, 2))
##D    X <- Xcand[Xsparse$inds,]
##D    plot(X$x1, X$x2, xlab=expression(x[1]), ylab=expression(x[2]), 
##D         xlim=c(0, 1), ylim=c(0, 1), 
##D         main=paste0("n=", n, "_p=", p, "_maximin=", maxmd))
##D    points(Xorig, col=2, pch=20)
##D    abline(h=c(0, 1), v=c(0, 1), lty=2, col=2)
##D    if(!is.null(Xorig))
##D    {
##D      legend("topright", "Xorig", xpd=TRUE, horiz=TRUE, 
##D             inset=c(-0.03, -0.05), pch=20, col=2, bty="n")
##D    }
##D    plot(log(na.omit(Xsparse$mis)), type="b", 
##D         xlab="iteration", ylab="log(minimum distance)", 
##D         main="progress on minimum distance")
##D    abline(v=n, lty=2)
##D    mtext(paste0("design size=", n), at=n, cex=0.6)
##D   
## End(Not run)
  
  ## maximin
  # generate the design
  library(lhs)
  n <- 10
  p <- 2
  T <- 10*n
  Xorig <- randomLHS(10, p)
  Xsparse <- maximin(n=n, p=p, T=T, Xorig=Xorig, Xinit=NULL, 
                     verb=FALSE, plot=FALSE, boundary=FALSE)
  maxmd <- as.numeric(format(round(Xsparse$mi[T+1], 5), nsmall=5))
  
  # visualization
  par(mfrow=c(1,2))
  plot(Xsparse$Xf[,1], Xsparse$Xf[,2], xlab=expression(x[1]), ylab=expression(x[2]), 
       xlim=c(0, 1), ylim=c(0, 1), 
       main=paste0("n=", n, "_p=", p, "_T=", T, "_maximin=", maxmd))
  points(Xorig, col=2, pch=20)
  abline(h=c(0,1), v=c(0,1), lty=2, col=2)
  if(!is.null(Xorig)) legend("topright", "Xorig", xpd=TRUE, horiz=TRUE, 
     inset=c(-0.03, -0.05), pch=20, col=2, bty="n")
  plot(log(Xsparse$mi), type="b", xlab="iteration", ylab="log(minimum distance)", 
       main="progress on minimum distance")
  abline(v=n, lty=2)
  mtext(paste0("design size=", n), at=n, cex=0.6)
  abline(v=T, lty=2)
  mtext(paste0("max.md=", maxmd), at=T, cex=0.6)



