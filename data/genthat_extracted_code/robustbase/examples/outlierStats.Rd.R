library(robustbase)


### Name: outlierStats
### Title: Robust Regression Outlier Statistics
### Aliases: outlierStats
### Keywords: robust regression

### ** Examples

## artificial data example
data <- expand.grid(grp1 = letters[1:5], grp2 = letters[1:5], rep=1:3)
set.seed(101)
data$y <- c(rt(nrow(data), 1))
## compute outlier statistics for all the estimators
control <- lmrob.control(method = "SMDM",
                         compute.outlier.stats = c("S", "MM", "SMD", "SMDM"))
## warning is only issued for some seeds
set.seed(2)
fit1 <- lmrob(y ~ grp1*grp2, data, control = control)
## do as suggested:
fit2 <- lmrob(y ~ grp1*grp2, data, setting = "KS2014")

## the plot function should work for such models as well
plot(fit1)

## Not run: 
##D   ## access statistics:
##D   fit1$ostats ## SMDM
##D   fit1$init$ostats ## SMD
##D   fit1$init$init$ostats ## SM
##D   fit1$init$init$init.S$ostats ## S
## End(Not run)



