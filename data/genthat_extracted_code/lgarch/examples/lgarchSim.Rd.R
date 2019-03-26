library(lgarch)


### Name: lgarchSim
### Title: Simulate from a univariate log-GARCH model
### Aliases: lgarchSim
### Keywords: Statistical Models Time Series Financial Econometrics

### ** Examples

##simulate 500 observations w/default parameter values:
set.seed(123)
y <- lgarchSim(500)

##simulate the same series, but with more output:
set.seed(123)
y <- lgarchSim(500, verbose=TRUE)
head(y)

##plot the simulated values:
plot(y)

##simulate w/conditioning variable:
x <- rnorm(500)
y <- lgarchSim(500, xreg=0.05*x)

##simulate from a log-GARCH with a simple form of leverage:
z <- rnorm(500)
zneg <- as.numeric(z < 0)
zneglagged <- glag(zneg, pad=TRUE, pad.value=0)
y <- lgarchSim(500, xreg=0.05*zneglagged, innovations=z)

##simulate from a log-GARCH w/standardised t-innovations:
set.seed(123)
n <- 500
df <- 5
z <- rt(n, df=df)/sqrt(df/(df-2))
y <- lgarchSim(n, innovations=z)




