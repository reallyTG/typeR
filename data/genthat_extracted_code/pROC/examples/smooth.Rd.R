library(pROC)


### Name: smooth
### Title: Smooth a ROC curve
### Aliases: smooth smooth.roc smooth.smooth.roc smooth.default
### Keywords: univar nonparametric utilities roc smooth

### ** Examples

data(aSAH)

##  Basic example
rocobj <- roc(aSAH$outcome, aSAH$s100b)
smooth(rocobj)
# or directly with roc()
roc(aSAH$outcome, aSAH$s100b, smooth=TRUE)

# plotting
plot(rocobj)
rs <- smooth(rocobj, method="binormal")
plot(rs, add=TRUE, col="green")
rs2 <- smooth(rocobj, method="density")
plot(rs2, add=TRUE, col="blue")
rs3 <- smooth(rocobj, method="fitdistr", density="lognormal")
plot(rs3, add=TRUE, col="magenta")
rs4 <- smooth(rocobj, method="logcondens")
plot(rs4, add=TRUE, col="brown")
rs5 <- smooth(rocobj, method="logcondens.smooth")
plot(rs5, add=TRUE, col="orange")
legend("bottomright", legend=c("Empirical", "Binormal", "Density", "Log-normal",
                               "Log-concave density", "Smoothed log-concave density"),
       col=c("black", "green", "blue", "magenta", "brown", "orange"), lwd=2)

## Advanced smoothing

# if we know the distributions are normal with sd=0.1 and an unknown mean:
smooth(rocobj, method="fitdistr", density=dnorm, start=list(mean=1), sd=.1)
# different distibutions for controls and cases:
smooth(rocobj, method="fitdistr", density.controls="normal", density.cases="lognormal")

# with densities
bw <- bw.nrd0(rocobj$predictor)
density.controls <- density(rocobj$controls, from=min(rocobj$predictor) - 3 * bw,
                            to=max(rocobj$predictor) + 3*bw, bw=bw, kernel="gaussian")
density.cases <- density(rocobj$cases, from=min(rocobj$predictor) - 3 * bw,
                            to=max(rocobj$predictor) + 3*bw, bw=bw, kernel="gaussian")
smooth(rocobj, method="density", density.controls=density.controls$y, 
       density.cases=density.cases$y)
# which is roughly what is done by a simple:
smooth(rocobj, method="density")

## Not run: 
##D ## Smoothing artificial ROC curves
##D 
##D rand.unif <- runif(1000, -1, 1)
##D rand.exp <- rexp(1000)
##D rand.norm <- 
##D rnorm(1000)
##D 
##D # two normals
##D roc.norm <- roc(controls=rnorm(1000), cases=rnorm(1000)+1, plot=TRUE)
##D plot(smooth(roc.norm), col="green", lwd=1, add=TRUE)
##D plot(smooth(roc.norm, method="density"), col="red", lwd=1, add=TRUE)
##D plot(smooth(roc.norm, method="fitdistr"), col="blue", lwd=1, add=TRUE)
##D plot(smooth(roc.norm, method="logcondens"), col="brown", lwd=1, add=TRUE)
##D plot(smooth(roc.norm, method="logcondens.smooth"), col="orange", lwd=1, add=TRUE)
##D legend("bottomright", legend=c("empirical", "binormal", "density", "fitdistr",
##D                                "logcondens", "logcondens.smooth"), 
##D        col=c(par("fg"), "green", "red", "blue", "brown", "orange"), lwd=c(2, 1, 1, 1))
##D        
##D # deviation from the normality
##D roc.norm.exp <- roc(controls=rnorm(1000), cases=rexp(1000), plot=TRUE)
##D plot(smooth(roc.norm.exp), col="green", lwd=1, add=TRUE)
##D plot(smooth(roc.norm.exp, method="density"), col="red", lwd=1, add=TRUE)
##D # Wrong fitdistr: normality assumed by default
##D plot(smooth(roc.norm.exp, method="fitdistr"), col="blue", lwd=1, add=TRUE)
##D # Correct fitdistr
##D plot(smooth(roc.norm.exp, method="fitdistr", density.controls="normal",
##D             density.cases="exponential"), col="purple", lwd=1, add=TRUE)
##D plot(smooth(roc.norm.exp, method="logcondens"), col="brown", lwd=1, add=TRUE)
##D plot(smooth(roc.norm.exp, method="logcondens.smooth"), col="orange", lwd=1, add=TRUE)
##D legend("bottomright", legend=c("empirical", "binormal", "density",
##D                                "wrong fitdistr", "correct fitdistr",
##D                                "logcondens", "logcondens.smooth"),
##D        col=c(par("fg"), "green", "red", "blue", "purple", "brown", "orange"), lwd=c(2, 1, 1, 1, 1))
##D 
##D # large deviation from the normality
##D roc.unif.exp <- roc(controls=runif(1000, 2, 3), cases=rexp(1000)+2, plot=TRUE)
##D plot(smooth(roc.unif.exp), col="green", lwd=1, add=TRUE)
##D plot(smooth(roc.unif.exp, method="density"), col="red", lwd=1, add=TRUE)
##D plot(smooth(roc.unif.exp, method="density", bw="ucv"), col="magenta", lwd=1, add=TRUE)
##D # Wrong fitdistr: normality assumed by default (uniform distributions not handled)
##D plot(smooth(roc.unif.exp, method="fitdistr"), col="blue", lwd=1, add=TRUE)
##D plot(smooth(roc.unif.exp, method="logcondens"), col="brown", lwd=1, add=TRUE)
##D plot(smooth(roc.unif.exp, method="logcondens.smooth"), col="orange", lwd=1, add=TRUE)
##D legend("bottomright", legend=c("empirical", "binormal", "density",
##D                                "density ucv", "wrong fitdistr",
##D                                "logcondens", "logcondens.smooth"),
##D        col=c(par("fg"), "green", "red", "magenta", "blue", "brown", "orange"), lwd=c(2, 1, 1, 1, 1))
## End(Not run)

# 2 uniform distributions with a custom density function
unif.density <- function(x, n, from, to, bw, kernel, ...) {
  smooth.x <- seq(from=from, to=to, length.out=n)
  smooth.y <- dunif(smooth.x, min=min(x), max=max(x))
  return(smooth.y)
}
roc.unif <- roc(controls=runif(1000, -1, 1), cases=runif(1000, 0, 2), plot=TRUE)
s <- smooth(roc.unif, method="density", density=unif.density)
plot(roc.unif)
plot(s, add=TRUE, col="grey")

## Not run: 
##D # you can bootstrap a ROC curve smoothed with a density function:
##D ci(s, boot.n=100)
## End(Not run)



