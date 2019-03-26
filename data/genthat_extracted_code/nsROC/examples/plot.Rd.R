library(nsROC)


### Name: plot
### Title: Plot an ROC curve object
### Aliases: plot.groc plot.rocbands plot.cdroc
### Keywords: plot

### ** Examples

# Data generation
set.seed(123)
X <- c(rnorm(45), rnorm(30,2,1.5))
D <- c(rep(0,45), rep(1,30))

# Plot an ROC curve
grocobj <- gROC(X,D)
plot(grocobj)

# Plot ROC curve confidence bands
rocbandsobj <- ROCbands(grocobj)
plot(rocbandsobj)

# Plot cumulative/dynamic ROC curve
set.seed(123)
stime <- rchisq(50,3)
status <- sample(c(rep(1,40), rep(0,10)))
marker <- max(stime) - stime + rnorm(50,0,2)
cdrocobj <- cdROC(stime, status, marker, 2.8, ci=TRUE)
plot(cdrocobj)



