library(mice)


### Name: mice
### Title: 'mice': Multivariate Imputation by Chained Equations
### Aliases: mice mice-package mice
### Keywords: iteration

### ** Examples



# do default multiple imputation on a numeric matrix
imp <- mice(nhanes)
imp

# list the actual imputations for BMI
imp$imp$bmi

# first completed data matrix
complete(imp)


# imputation on mixed data with a different method per column

mice(nhanes2, meth=c('sample','pmm','logreg','norm'))




