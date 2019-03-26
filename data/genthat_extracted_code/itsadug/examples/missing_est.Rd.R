library(itsadug)


### Name: missing_est
### Title: Return indices of data that were not fitted by the model.
### Aliases: missing_est

### ** Examples

data(simdat)

# Add missing values:
set.seed(123)
simdat[sample(nrow(simdat), size=20),]$Y <- NA
# Fit simple linear model:
lm1 <- lm(Y ~ Time, data=simdat)
na.el <- missing_est(lm1)
length(na.el)




