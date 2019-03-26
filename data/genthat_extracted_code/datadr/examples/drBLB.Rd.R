library(datadr)


### Name: drBLB
### Title: Bag of Little Bootstraps Transformation Method
### Aliases: drBLB

### ** Examples

## Not run: 
##D # BLB is meant to run on random replicate divisions
##D rrAdult <- divide(adult, by = rrDiv(1000), update = TRUE)
##D 
##D adultBlb <- rrAdult %>% addTransform(function(x) {
##D   drBLB(x,
##D     statistic = function(x, weights)
##D       coef(glm(incomebin ~ educationnum + hoursperweek + sex,
##D         data = x, weights = weights, family = binomial())),
##D     metric = function(x)
##D       quantile(x, c(0.05, 0.95)),
##D     R = 100,
##D     n = nrow(rrAdult)
##D   )
##D })
##D 
##D # compute the mean of the resulting CI limits
##D # (this will take a little bit of time because of resampling)
##D coefs <- recombine(adultBlb, combMean)
##D matrix(coefs, ncol = 2, byrow = TRUE)
## End(Not run)



