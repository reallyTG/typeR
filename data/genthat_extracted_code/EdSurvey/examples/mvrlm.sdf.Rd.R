library(EdSurvey)


### Name: mvrlm.sdf
### Title: Multivariate Regression
### Aliases: mvrlm.sdf

### ** Examples

## Not run: 
##D # read in the example data (generated, not real student data)
##D sdf <- readNAEP(system.file("extdata/data", "M36NT2PM.dat", package = "NAEPprimer"))
##D 
##D # Use | symbol to separate dependent variables in the left hand side of formula
##D mvrlm.fit <- mvrlm.sdf(algebra | geometry ~ dsex + m072801, jrrIMax = 5, data = sdf)
##D 
##D # print method returns coefficients, as does coef method
##D mvrlm.fit
##D coef(mvrlm.fit)
##D 
##D # for more detailed results use summary:
##D summary(mvrlm.fit)
##D 
##D # Details of model can also be accessed through components of the returned object, for example:
##D 
##D # coefficients (1 column per dependent variable)
##D mvrlm.fit$coef
##D # coefficient table with standard errors and p-values (1 table per dependent variable)
##D mvrlm.fit$coefmat
##D # R-squared values (1 per dependent variable)
##D mvrlm.fit$r.squared
##D # Residual covariance matrix
##D mvrlm.fit$residCov
##D 
##D # Model residuals and other details are available as well
##D 
##D # show the structure of the residuals objects
##D str(mvrlm.fit$residuals)
##D str(mvrlm.fit$residPV)
##D 
##D # dependent variables can have plausible values or not (or a combination)
##D 
##D mvrlm.fit <- mvrlm.sdf(composite | mrps22 ~ dsex + m072801, data = sdf, jrrIMax = 5)
##D summary(mvrlm.fit)
##D 
##D mvrlm.fit <- mvrlm.sdf(algebra | geometry | measurement ~ dsex + m072801, data = sdf, jrrIMax = 5)
##D summary(mvrlm.fit)
##D 
##D mvrlm.fit <- mvrlm.sdf(mrps51 | mrps22 ~ dsex + m072801, data = sdf, jrrIMax = 5)
##D summary(mvrlm.fit)
##D 
##D # Hypotheses about coefficient restrictions can also be tested using the Wald test
##D 
##D mvr <- mvrlm.sdf(algebra | geometry ~ dsex + m072801, data = sdf)
##D 
##D hypothesis <- c("geometry_dsexFemale = 0", "algebra_dsexFemale = 0")
##D 
##D # test statistics based on the F and Chi-squared distribution are available
##D linearHypothesis(mvr, hypothesis = hypothesis, test = "F")
##D linearHypothesis(mvr, hypothesis = hypothesis, test = "Chisq")
##D 
## End(Not run)



