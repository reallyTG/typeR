library(nlshelper)


### Name: tidy.nlsList
### Title: Tidy method for nlsList
### Aliases: tidy.nlsList

### ** Examples

chick <- as.data.frame(ChickWeight)

# Fit an nlsList model, with a grouping variable (Diet)
fit1 <- nlsList(weight ~ a*Time^b | Diet, data=chick, start=list(a=10, b=1.1))

# Collect coefficients
tidy(fit1)

# ... and confidence intervals
tidy(fit1, conf.int=TRUE)



