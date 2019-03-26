library(Hmisc)


### Name: rm.boot
### Title: Bootstrap Repeated Measurements Model
### Aliases: rm.boot plot.rm.boot
### Keywords: regression multivariate htest hplot

### ** Examples

# Generate multivariate normal responses with equal correlations (.7)
# within subjects and no correlation between subjects
# Simulate realizations from a piecewise linear population time-response
# profile with large subject effects, and fit using a 6-knot spline
# Estimate the correlation structure from the residuals, as a function
# of the absolute time difference


# Function to generate n p-variate normal variates with mean vector u and
# covariance matrix S
# Slight modification of function written by Bill Venables
# See also the built-in function rmvnorm
mvrnorm <- function(n, p = 1, u = rep(0, p), S = diag(p)) {
  Z <- matrix(rnorm(n * p), p, n)
  t(u + t(chol(S)) %*% Z)
}


n     <- 20         # Number of subjects
sub   <- .5*(1:n)   # Subject effects


# Specify functional form for time trend and compute non-stochastic component
times <- seq(0, 1, by=.1)
g     <- function(times) 5*pmax(abs(times-.5),.3)
ey    <- g(times)


# Generate multivariate normal errors for 20 subjects at 11 times
# Assume equal correlations of rho=.7, independent subjects


nt    <- length(times)
rho   <- .7


        
set.seed(19)        
errors <- mvrnorm(n, p=nt, S=diag(rep(1-rho,nt))+rho)
# Note:  first random number seed used gave rise to mean(errors)=0.24!


# Add E[Y], error components, and subject effects
y      <- matrix(rep(ey,n), ncol=nt, byrow=TRUE) + errors + 
          matrix(rep(sub,nt), ncol=nt)


# String out data into long vectors for times, responses, and subject ID
y      <- as.vector(t(y))
times  <- rep(times, n)
id     <- sort(rep(1:n, nt))


# Show lowess estimates of time profiles for individual subjects
f <- rm.boot(times, y, id, plot.individual=TRUE, B=25, cor.pattern='estimate',
             smoother=lowess, bootstrap.type='x fixed', nk=6)
# In practice use B=400 or 500
# This will compute a dependent-structure log-likelihood in addition
# to one assuming independence.  By default, the dep. structure
# objective will be used by the plot method  (could have specified rho=.7)
# NOTE: Estimating the correlation pattern from the residual does not
# work in cases such as this one where there are large subject effects


# Plot fits for a random sample of 10 of the 25 bootstrap fits
plot(f, individual.boot=TRUE, ncurves=10, ylim=c(6,8.5))


# Plot pointwise and simultaneous confidence regions
plot(f, pointwise.band=TRUE, col.pointwise=1, ylim=c(6,8.5))


# Plot population response curve at average subject effect
ts <- seq(0, 1, length=100)
lines(ts, g(ts)+mean(sub), lwd=3)


## Not run: 
##D #
##D # Handle a 2-sample problem in which curves are fitted 
##D # separately for males and females and we wish to estimate the
##D # difference in the time-response curves for the two sexes.  
##D # The objective criterion will be taken by plot.rm.boot as the 
##D # total of the two sums of squared errors for the two models
##D #
##D knots <- rcspline.eval(c(time.f,time.m), nk=6, knots.only=TRUE)
##D # Use same knots for both sexes, and use a times vector that 
##D # uses a range of times that is included in the measurement 
##D # times for both sexes
##D #
##D tm <- seq(max(min(time.f),min(time.m)),
##D           min(max(time.f),max(time.m)),length=100)
##D 
##D 
##D f.female <- rm.boot(time.f, bp.f, id.f, knots=knots, times=tm)
##D f.male   <- rm.boot(time.m, bp.m, id.m, knots=knots, times=tm)
##D plot(f.female)
##D plot(f.male)
##D # The following plots female minus male response, with 
##D # a sequence of shaded confidence band for the difference
##D plot(f.female,f.male,multi=TRUE)
##D 
##D 
##D # Do 1000 simulated analyses to check simultaneous coverage 
##D # probability.  Use a null regression model with Gaussian errors
##D 
##D 
##D n.per.pt <- 30
##D n.pt     <- 10
##D 
##D 
##D null.in.region <- 0
##D 
##D 
##D for(i in 1:1000) {
##D   y    <- rnorm(n.pt*n.per.pt)
##D   time <- rep(1:n.per.pt, n.pt)
##D #  Add the following line and add ,id=id to rm.boot to use clustering
##D #  id   <- sort(rep(1:n.pt, n.per.pt))
##D #  Because we are ignoring patient id, this simulation is effectively
##D #  using 1 point from each of 300 patients, with times 1,2,3,,,30 
##D 
##D 
##D   f <- rm.boot(time, y, B=500, nk=5, bootstrap.type='x fixed')
##D   g <- plot(f, ylim=c(-1,1), pointwise=FALSE)
##D   null.in.region <- null.in.region + all(g$lower<=0 & g$upper>=0)
##D   prn(c(i=i,null.in.region=null.in.region))
##D }
##D 
##D 
##D # Simulation Results: 905/1000 simultaneous confidence bands 
##D # fully contained the horizontal line at zero
## End(Not run)



