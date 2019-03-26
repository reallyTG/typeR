library(VGAMextra)


### Name: VGAMextra-package
### Title: Additions and extensions of the VGAM package.
### Aliases: VGAMextra-package VGAMextra
### Keywords: package time series mean modelling quantile modelling

### ** Examples

##### EXAMPLE 1. An AR(1) model with ARCH(1) errors.
# Chan et.al. (2013) proposed a long and technical methodology to
# estimate the tail index of an AR(1) with ARCH(1) errors involving 
# its estimation by QMLE. I fit this model straightforwardly by MLE
# using the family function ARXff() for time series, and constraining
# the effect of Y^2_{t - 1} to the conditional variance using
# constraint matrices.


# Generate some data
set.seed(1)
nn       <- ceiling(runif(1, 150, 160))
my.rho   <- rhobit(-1.0, inverse = TRUE)  # -0.46212
my.mu    <- 0.0
my.omega <- 1
my.b     <- 0.5
tsdata   <- data.frame(x2 =  sort(runif(n = nn)))
tsdata   <- transform(tsdata, index = 1:nn, TS1   = runif(nn))

for (ii in 2:nn)
  tsdata$TS1[ii] <- my.mu + my.rho * tsdata$TS1[ii-1] +
  sqrt(my.omega + my.b * (tsdata$TS1[ii-1])^2) * rnorm(1)
  
# Remove the burn-in data:
nnr <- ceiling(nn/5)
tsdata <- tsdata[-(1:nnr), ]
tsdata["index"] <- 1:(nn - nnr)

## No test: 
# The timeplot.
with(tsdata, plot(ts(TS1), lty = "solid", col = "blue", xlab ="Time", ylab = "Series"))
abline(h = mean(tsdata[, "TS1"]), lty = "dotted")
## End(No test)
# The constraint matrices, to inhibit the effect of Y^2_{t - 1}
# over sigma^2 only.
const.mat <- list('(Intercept)' = diag(3), 'TS1l1sq' = cbind(c(0, 1, 0)))

# Set up the data using function WN.lags() from VGAMextra to generate
# our 'explanatory'
tsdata <- transform(tsdata, TS1l1sq = WN.lags(y = cbind(tsdata[, "TS1"])^2, lags = 1))

# Fitting the model
fit.Chan.etal <- vglm(TS1 ~ TS1l1sq, ARXff(order = 1,   # AR order 
                                          zero = NULL, noChecks = FALSE,
                                          var.arg = TRUE, lvar = "identitylink"),
             crit = "loglikelihood", trace = TRUE,
             constraints = const.mat, data = tsdata)  ## Constraints...
summary(fit.Chan.etal, lrt0 = TRUE, score0 = TRUE, wald0 = TRUE)
constraints(fit.Chan.etal)


###### EXAMPLE 2. VGLMs handling cointegrated (bivariate) time series.
# In this example, vglm() accommodates an error correction model
# of order (2, 2) to fit two (non-stationary) cointegrated time series.

# Simulating some data.
set.seed(2017081901)
nn <- 280
rho <- 0.75
s2u <- exp(log(1.5))  # Gaussian noise1
s2w <- exp(0)         # Gaussian noise2
my.errors <- rbinorm(nn, mean1 = 0, mean2 = 0, var1 = s2u, var2 = s2w, cov12 = rho)
ut <- my.errors[, 1]
wt <- my.errors[, 2]
yt <- xt <- numeric(0)

xt[1] <- ut[1]     # Initial value: error.u[0]
yt[1] <- wt[1]     # Initial value: error.w[0]
beta <- c(0.0, 2.5, -0.32)  # Coefficients true values.

for (ii in 2:nn) {
  xt[ii] <-  xt[ii - 1] + ut[ii]
  yt[ii] <- beta[1] + beta[2] * xt[ii]  + beta[3] * yt[ii - 1] + wt[ii]
}

# Regression of yt on xt, save residuals. Compute Order--1 differences.
errors.coint <- residuals(lm(yt ~ xt)) # Residuals from the static regression yt ~ xt
difx1 <- diff(ts(xt), lag = 1, differences = 1)  # First difference for xt
dify1 <- diff(ts(yt), lag = 1, differences = 1)  # First difference for yt

# Set up the dataset (coint.data), including Order-2 lagged differences.
coint.data <- data.frame(embed(difx1, 3), embed(dify1, 3)) 
colnames(coint.data) <- c("difx1", "difxLag1", "difxLag2",
                          "dify1", "difyLag1", "difyLag2")

# Remove unutilized lagged errors accordingly. Here, use from t = 3.
errors.cointLag1 <- errors.coint[-c(1:2, nn)]
coint.data <- transform(coint.data, errors.cointLag1 = errors.cointLag1)

## No test: 
# Plotting the data
plot(ts(yt[-c(1:3, NULL)]), lty = 4, type = "l", col = "red",
     main = "", xlab = "Time", las = 1, ylim = c(-32, 20),
     ylab = expression("Series"~x[t]~"and"~y[t]))
lines(ts(xt[-c(1:3, NULL)]), lty = 4, type = "l", col = "blue")
legend("bottomleft", c(expression("Series"~x[t]),
                       expression("Series"~y[t])),
       col = c("red", "blue"), lty = c(4, 4))
## End(No test)

# Fitting an error correction model (2, 2), aka ECM(2, 2)
fit.coint <- vglm(cbind(dify1, difx1) ~ errors.cointLag1 + difxLag1 + difyLag1 + 
                                           difxLag2 + difyLag2,
          binormal(zero = c("sd", "rho")),  # 'sigma', 'rho' are intercept--only.
          trace = FALSE, data = coint.data)
summary(fit.coint)
coef(fit.coint, matrix = TRUE)


##### EXAMPLE 3. Quantile Modelling (QM).
# Here, the quantile function of the Maxwell distribution is modelled
# for percentiles 25%, 50% and 75%. The resulting quantile-curves
# are plotted. The rate parameter is determined by an artificial covariate.

set.seed(123)
# An artificial covariate.
maxdata <- data.frame(x2 = sort(runif(n <- nn <- 120)))
# The 'rate' function.
mymu <- function(x) exp(2 -  6 * sin(2 * x - 0.2) / (x + 0.5)^2)
# Set up the data.
maxdata <- transform(maxdata, y = rmaxwell(n, rate = mymu(x2)))

# 25%, 50% and 75% quantiles are to be modelled.
mytau <- c(0.25, 0.50, 0.75)
mydof <- 4

### Using B-splines with 'mydof'-degrees of freedom on the predictors
fit.QM <- vglm(Q.reg(y, pvector = mytau) ~ bs(x2, df = mydof),
                 family = maxwell(link = maxwellQlink(p = mytau), zero = NULL),
                 data = maxdata, trace = TRUE)
            
summary(fit.QM, lscore0 = TRUE)
head(predictors(fit.QM))         # The 'fitted values'

## No test: 
## The 25%, 50%, and 75% quantile curves.
mylwd <- 1.5
with(maxdata, plot(x2, y, col = "orange",
                 main = "Example 1; Quantile Modelling",
                 ylab = "y", pch = "o", cex = 0.75))
with(maxdata, matlines(x2, predict(fit.QM)[, 1], col = "blue",
                       lty = "dotted", lwd = mylwd))
with(maxdata, matlines(x2, predict(fit.QM)[, 2], col = "chocolate",
                       lty = "dotted", lwd = mylwd))
with(maxdata, matlines(x2, predict(fit.QM)[, 3], col = "brown",
                       lty = "dotted", lwd = mylwd))
legend("topleft", c("percentile25", "percentile50", "percentile75"),
       lty = rep("dotted", 3), lwd = rep(mylwd, 3))
## End(No test)

### Double check: The data (in percentage) below the 25%, 50%, and 75% curves
round(length(predict(fit.QM)[, 1][(maxdata$y
                 <= predict(fit.QM)[, 1] )]) /nn, 5) * 100  ## Should be 25% approx
round(length(predict(fit.QM)[, 2][(maxdata$y
                 <= predict(fit.QM)[, 2] )]) /nn, 5) * 100  ## Should be 50% approx
round(length(predict(fit.QM)[, 3][(maxdata$y
                 <= predict(fit.QM)[, 3] )]) /nn, 5) * 100  ## Should be 75% approx



