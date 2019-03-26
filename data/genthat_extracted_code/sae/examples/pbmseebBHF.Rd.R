library(sae)


### Name: pbmseebBHF
### Title: Parametric bootstrap mean squared error estimators of EB
###   estimators.
### Aliases: pbmseebBHF
### Keywords: method

### ** Examples

data(incomedata)         # Load data set
attach(incomedata)

# Construct design matrix for sample elements
Xs<-cbind(age2,age3,age4,age5,nat1,educ1,educ3,labor1,labor2)

# Select the domains to compute EB estimators
data(Xoutsamp)
domains <- c(5)

# Poverty incidence indicator
povertyline <- 0.6*median(incomedata$income)
povertyline                         # 6477.484
povinc <- function(y)    
{
   z <- 6477.484
   result <- mean(y<z)
   return (result)
}

# Compute parametric bootstrap MSE estimators of the EB 
# predictors of poverty incidence. Take constant=3600 to achieve 
# approximately symmetric residuals.
set.seed(123)
result <- pbmseebBHF(income~Xs, dom=prov, selectdom=domains,
                     Xnonsample=Xoutsamp, B=2, MC=2, constant=3600,
                     indicator=povinc)
result$est$eb
result$mse
result$est$fit$refvar

detach(incomedata)



