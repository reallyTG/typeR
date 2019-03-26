library(lgarch)


### Name: mlgarchSim
### Title: Simulate from a multivariate log-GARCH(1,1) model
### Aliases: mlgarchSim
### Keywords: Statistical Models Time Series Financial Econometrics

### ** Examples

##simulate 1000 observations from a multivariate
##ccc-log-garch(1,1) w/default parameter values:
set.seed(123)
y <- mlgarchSim(1000)

##simulate the same series, but with more output:
set.seed(123)
y <- mlgarchSim(1000, verbose=TRUE)
head(y)

##plot the simulated values:
plot(y)




