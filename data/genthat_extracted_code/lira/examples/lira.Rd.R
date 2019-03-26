library(lira)


### Name: lira
### Title: LInear Regression in Astronomy
### Aliases: lira
### Keywords: regression models multivariate

### ** Examples

## EXAMPLE 1
## sample length
n.sample <- 20
# intrinsic p(Z) distribution of the independet variable
mu.Z.0 <- 0.0; sigma.Z.0 <- 1.0;
Z <- rnorm(n.sample, mean = mu.Z.0, sd = sigma.Z.0)
# X is unscattered
X <- Z
# observational uncertainties in X
delta.x.sd <- 0.04
delta.x <- rnorm(n.sample, sd = delta.x.sd)
x <- X + delta.x
# scaling relation Y-Z
alpha.YIZ <- 0.0; beta.YIZ <- 1.0; sigma.YIZ.0 <- 0.1;
# dependent variable
Y <- alpha.YIZ + beta.YIZ*Z + rnorm(n.sample, sd = sigma.YIZ.0)
# observational uncertainties in Y
delta.y.sd <- 0.05
delta.y <- rnorm(n.sample, sd = delta.y.sd)
y <- Y + delta.y
data.all <- data.frame(x=x, y=y, delta.x=delta.x.sd, delta.y=delta.y.sd)
# regression
samples <- lira(x, y, delta.x=delta.x, delta.y=delta.y, n.adapt=100, n.iter=1000)

## EXAMPLE 2
## Malmquist bias: only objects with y > y.th are selected.
y.th <- -0.5
# the sample is truncated
data.sel <- data.all[which(data.all$y>y.th),]
n.sel <- nrow(data.sel)
# regression
samples.MB <- lira(data.sel$x, data.sel$y, data.sel$delta.x, data.sel$delta.y, 
y.threshold = rep(y.th,n.sel), n.adapt=100, n.iter=1000, print.summary=FALSE)

## EXAMPLE 3
## Upper limits: objects with y < y.th are left-censored
# censoring
data.ul <- data.all
index.ul <- which(data.ul$y<y.th)
data.ul[index.ul,]$y <- NA
data.ul[index.ul,]$delta.y <- 2
# upper limits for undetected (detected) objects are set to the threshold value (NA).
y.upperlimit <- rep(NA, n.sample) 
y.upperlimit[index.ul] <- y.th
# the regression recovers the parameters of the scaling relation and 
# forecasts the Y-values of the censored objects.
samples.UL <- lira(data.ul$x, data.ul$y, data.ul$delta.x, data.ul$delta.y, 
y.upperlimit = y.upperlimit, n.adapt=100, n.iter=1000, Y.monitored=TRUE)


## Further examples can be found at http://pico.oabo.inaf.it/~sereno/LIRA/.



