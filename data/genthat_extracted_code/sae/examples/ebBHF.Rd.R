library(sae)


### Name: ebBHF
### Title: EB estimators of an indicator with non-sample values of
###   auxiliary variables.
### Aliases: ebBHF
### Keywords: method

### ** Examples

data(incomedata)         # Load data set
attach(incomedata)

# Construct design matrix for sample elements
Xs <- cbind(age2, age3, age4, age5, nat1, educ1, educ3, labor1, labor2)

# Select the domains to compute EB estimators. 
data(Xoutsamp)
domains <- unique(Xoutsamp[,"domain"])

# Poverty gap indicator
povertyline <- 0.6*median(income)
povertyline                         # 6477.484
povgap <- function(y)     
{
   z <- 6477.484
   result <- mean((y<z) * (z-y) / z) 
   return (result)
}

# Compute EB predictors of poverty gap. The value constant=3600 is selected
# to achieve approximately symmetric residuals.
set.seed(123)
result <- ebBHF(income ~ Xs, dom=prov, selectdom=domains,
                Xnonsample=Xoutsamp, MC=10, constant=3600, indicator=povgap)
result$eb
result$fit$summary
result$fit$fixed
result$fit$random[,1]
result$fit$errorvar
result$fit$refvar
result$fit$loglike
result$fit$residuals[1:10]

detach(incomedata)



