library(cmm)


### Name: SampleStatistics
### Title: SampleStatistics
### Aliases: SampleStatistics
### Keywords: univar

### ** Examples

## Not run: 
##D data(BodySatisfaction)
##D 
##D ## Table 2.6 in Bergsma, Croon and Hagenaars (2009). Loglinear parameters for marginal table IS
##D ## We provide two to obtain the parameters
##D 
##D dat   <- BodySatisfaction[,2:8]        # omit first column corresponding to gender
##D 
##D # matrix producing 1-way marginals, ie the 7x5 table IS
##D at75 <- MarginalMatrix(var = c(1, 2, 3, 4, 5, 6, 7), 
##D  marg = list(c(1),c(2),c(3), c(4),c(5),c(6),c(7)), dim = c(5, 5, 5, 5, 5, 5, 5))
##D 
##D # First method: the "coefficients" are the log-probabilities, from which all the 
##D # (loglinear) parameters are calculated
##D stats <- SampleStatistics(dat = dat, coeff = list("log",at75), CoefficientDimensions = c(7, 5),
##D  Labels = c("I", "S"), ShowCoefficients = FALSE, ShowParameters = TRUE)
##D 
##D # Second method: the "coefficients" are explicitly specified as being the 
##D # (highest-order) loglinear parameters
##D loglinpar75 <- SpecifyCoefficient("LoglinearParameters", c(7, 5))
##D stats <- SampleStatistics(dat = dat, coeff = list(loglinpar75, at75), 
##D  CoefficientDimensions = c(7,5), Labels = c("I","S"))
## End(Not run)



