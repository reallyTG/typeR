library(Hmisc)


### Name: labcurve
### Title: Label Curves, Make Keys, and Interactively Draw Points and
###   Curves
### Aliases: labcurve putKey putKeyEmpty largest.empty drawPlot
###   plot.drawPlot bezier
### Keywords: hplot aplot dplot iplot

### ** Examples

n <- 2:8
m <-  length(n)
type <- c('l','l','l','l','s','l','l')
# s=step function l=ordinary line (polygon)
curves <- vector('list', m)


plot(0,1,xlim=c(0,1),ylim=c(-2.5,4),type='n')


set.seed(39)


for(i in 1:m) {
  x <- sort(runif(n[i]))
  y <- rnorm(n[i])
  lines(x, y, lty=i, type=type[i], col=i)
  curves[[i]] <- list(x=x,y=y)
}


labels <- paste('Label for',letters[1:m])
labcurve(curves, labels, tilt=TRUE, type=type, col=1:m)


# Put only single letters on curves at points of 
# maximum space, and use key() to define the letters,
# with automatic positioning of the key in the most empty
# part of the plot
# Have labcurve do the plotting, leaving extra space for key


names(curves) <- labels
labcurve(curves, keys=letters[1:m], type=type, col=1:m,
         pl=TRUE, ylim=c(-2.5,4))


# Put plotting symbols at equally-spaced points,
# with a key for the symbols, ignoring line types


labcurve(curves, keys=1:m, lty=1, type=type, col=1:m,
         pl=TRUE, ylim=c(-2.5,4))




# Plot and label two curves, with line parameters specified with data
set.seed(191)
ages.f <- sort(rnorm(50,20,7))
ages.m <- sort(rnorm(40,19,7))
height.f <- pmin(ages.f,21)*.2+60
height.m <- pmin(ages.m,21)*.16+63


labcurve(list(Female=list(ages.f,height.f,col=2),
              Male  =list(ages.m,height.m,col=3,lty='dashed')),
         xlab='Age', ylab='Height', pl=TRUE)
# add ,keys=c('f','m') to label curves with single letters
# For S-Plus use lty=2


# Plot power for testing two proportions vs. n for various odds ratios, 
# using 0.1 as the probability of the event in the control group.  
# A separate curve is plotted for each odds ratio, and the curves are
# labeled at points of maximum separation


n  <- seq(10, 1000, by=10)
OR <- seq(.2,.9,by=.1)
pow <- lapply(OR, function(or,n)list(x=n,y=bpower(p1=.1,odds.ratio=or,n=n)),
              n=n)
names(pow) <- format(OR)
labcurve(pow, pl=TRUE, xlab='n', ylab='Power')


# Plot some random data and find the largest empty rectangle
# that is at least .1 wide and .1 tall


x <- runif(50)
y <- runif(50)
plot(x, y)
z <- largest.empty(x, y, .1, .1)
z
points(z,pch=3)  # mark center of rectangle, or
polygon(z$rect, col='blue')  # to draw the rectangle, or
#key(z$x, z$y, ... stuff for legend)




# Use the mouse to draw a series of points using one symbol, and
# two smooth curves or straight lines (if two points are clicked), 
# none of these being labeled


# d <- drawPlot(Points(), Curve(), Curve())
# plot(d)


## Not run: 
##D # Use the mouse to draw a Gaussian density, two series of points
##D # using 2 symbols, one Bezier curve, a step function, and raw data
##D # along the x-axis as a 1-d scatter plot (rug plot).  Draw a key.
##D # The density function is fit to 3 mouse clicks
##D # Abline draws a dotted horizontal reference line
##D d <- drawPlot(Curve('Normal',type='gauss'),
##D               Points('female'), Points('male'), 
##D               Curve('smooth',ask=TRUE,lty=2), Curve('step',type='s',lty=3), 
##D               Points(type='r'), Abline(h=.5, lty=2),
##D               xlab='X', ylab='y', xlim=c(0,100), key=TRUE)
##D plot(d, ylab='Y')
##D plot(d, key=FALSE)  # label groups using labcurve
## End(Not run)



