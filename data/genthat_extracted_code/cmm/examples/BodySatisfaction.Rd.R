library(cmm)


### Name: BodySatisfaction
### Title: Body satisfaction for seven body parts
### Aliases: BodySatisfaction
### Keywords: datasets

### ** Examples

data(BodySatisfaction)

## Reproduction of Table 2.5 in Bergsma, Croon, & Hagenaars (2009)
sapply(2:8,function(i){table(BodySatisfaction[,i])})

## Table 2.6 in Bergsma, Croon and Hagenaars (2009). 
## Loglinear parameters for marginal table IS
## We provide two to obtain the parameters

## Reproduction of Table 2.7 in Bergsma, Croon, & Hagenaars (2009)
Table.2.7.male <- 
 sapply(2:8,function(i){table(BodySatisfaction[BodySatisfaction[1]=="Male",i])})
Table.2.7.male
#totals
apply(Table.2.7.male,2,sum)                               
#means
apply(Table.2.7.male,2,function(x){sum(c(1:5)*x/sum(x))}) 
#standard deviations
sqrt(apply(Table.2.7.male,2,function(x){(sum(c(1:5)^2*x/sum(x)))-(sum(c(1:5)*x/sum(x)))^2}))
                                                           

## Not run: 
##D dat   <- BodySatisfaction[,2:8]        # omit first column corresponding to gender
##D 
##D # matrix producing 1-way marginals, ie the 7x5 table IS
##D at75 <- MarginalMatrix(var = c(1, 2, 3, 4, 5, 6, 7), 
##D   marg = list(c(1),c(2),c(3),c(4),c(5),c(6),c(7)), 
##D   dim = c(5, 5, 5, 5, 5, 5, 5))
##D # First method: the "coefficients" are the log-probabilities, 
##D # from which all the (loglinear) parameters are calculated
##D stats <- SampleStatistics(dat = dat, 
##D   coeff = list("log", at75), 
##D   CoefficientDimensions=c(7, 5),
##D   Labels=c("I", "S"),
##D   ShowCoefficients = FALSE,
##D   ShowParameters = TRUE)
##D 
##D  # Second method: the "coefficients" are explicitly specified as being the 
##D  # (highest-order) loglinear parameters
##D  loglinpar75 <- SpecifyCoefficient("LoglinearParameters", c(7,5) )
##D  stats = SampleStatistics(dat = dat, 
##D   coeff = list(loglinpar75, at75), 
##D   CoefficientDimensions = c(7, 5), 
##D   Labels = c("I", "S"))
## End(Not run)
#For further worked examples from the book, 
# see http://stats.lse.ac.uk/bergsma/cmm/R files/BodySatisfaction.R



