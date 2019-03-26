library(Hmisc)


### Name: curveRep
### Title: Representative Curves
### Aliases: curveRep print.curveRep plot.curveRep curveSmooth
### Keywords: multivariate hplot

### ** Examples

## Not run: 
##D # Simulate 200 curves with pre-curve sample sizes ranging from 1 to 10
##D # Make curves with odd-numbered IDs have an x-distribution that is random
##D # uniform [0,1] and those with even-numbered IDs have an x-dist. that is
##D # half as wide but still centered at 0.5.  Shift y values higher with
##D # increasing IDs
##D set.seed(1)
##D N <- 200
##D nc <- sample(1:10, N, TRUE)
##D id <- rep(1:N, nc)
##D x <- y <- id
##D for(i in 1:N) {
##D   x[id==i] <- if(i %% 2) runif(nc[i]) else runif(nc[i], c(.25, .75))
##D   y[id==i] <- i + 10*(x[id==i] - .5) + runif(nc[i], -10, 10)
##D }
##D 
##D w <- curveRep(x, y, id, kxdist=2, p=10)
##D w
##D par(ask=TRUE, mfrow=c(4,5))
##D plot(w)                # show everything, profiles going across
##D par(mfrow=c(2,5))
##D plot(w,1)              # show n=1 results
##D # Use a color assignment table, assigning low curves to green and
##D # high to red.  Unique curve (subject) IDs are the names of the vector.
##D cols <- c(rep('green', N/2), rep('red', N/2))
##D names(cols) <- as.character(1:N)
##D plot(w, 3, idcol=cols)
##D par(ask=FALSE, mfrow=c(1,1))
##D 
##D plot(w, 1, 'lattice')  # show n=1 results
##D plot(w, 3, 'lattice')  # show n=4-5 results
##D plot(w, 3, 'lattice', idcol=cols)  # same but different color mapping
##D plot(w, 3, 'lattice', m=1)  # show a single "representative" curve
##D # Show median, 10th, and 90th percentiles of supposedly representative curves
##D plot(w, 3, 'lattice', m='quantiles', probs=c(.5,.1,.9))
##D # Same plot but with much less grouping of x variable
##D plot(w, 3, 'lattice', m='quantiles', probs=c(.5,.1,.9), nx=2)
##D 
##D # Smooth data before profiling.  This allows later plotting to plot
##D # smoothed representative curves rather than raw curves (which
##D # specifying smooth=TRUE to curveRep would do, if curveSmooth was not used)
##D d <- curveSmooth(x, y, id)
##D w <- with(d, curveRep(x, y, id))
##D 
##D # Example to show that curveRep can cluster profiles correctly when
##D # there is no noise.  In the data there are four profiles - flat, flat
##D # at a higher mean y, linearly increasing then flat, and flat at the
##D # first height except for a sharp triangular peak
##D 
##D set.seed(1)
##D x <- 0:100
##D m <- length(x)
##D profile <- matrix(NA, nrow=m, ncol=4)
##D profile[,1] <- rep(0, m)
##D profile[,2] <- rep(3, m)
##D profile[,3] <- c(0:3, rep(3, m-4))
##D profile[,4] <- c(0,1,3,1,rep(0,m-4))
##D col <- c('black','blue','green','red')
##D matplot(x, profile, type='l', col=col)
##D xeval <- seq(0, 100, length.out=5)
##D s <- x ##D 
##D matplot(x[s], profile[s,], type='l', col=col)
##D 
##D id <- rep(1:100, each=m)
##D X <- Y <- id
##D cols <- character(100)
##D names(cols) <- as.character(1:100)
##D for(i in 1:100) {
##D   s <- id==i
##D   X[s] <- x
##D   j <- sample(1:4,1)
##D   Y[s] <- profile[,j]
##D   cols[i] <- col[j]
##D }
##D table(cols)
##D yl <- c(-1,4)
##D w <- curveRep(X, Y, id, kn=1, kxdist=1, k=4)
##D plot(w, 1, 'lattice', idcol=cols, ylim=yl)
##D # Found 4 clusters but two have same profile
##D w <- curveRep(X, Y, id, kn=1, kxdist=1, k=3)
##D plot(w, 1, 'lattice', idcol=cols, freq=cols, plotfreq=TRUE, ylim=yl)
##D # Incorrectly combined black and red because default value p=5 did
##D # not result in different profiles at x=xeval
##D w <- curveRep(X, Y, id, kn=1, kxdist=1, k=4, p=40)
##D plot(w, 1, 'lattice', idcol=cols, ylim=yl)
##D # Found correct clusters because evaluated curves at 40 equally
##D # spaced points and could find the sharp triangular peak in profile 4
## End(Not run)



