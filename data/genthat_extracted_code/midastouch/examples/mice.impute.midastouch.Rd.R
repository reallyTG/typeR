library(midastouch)


### Name: mice.impute.midastouch
### Title: Predictive Mean Matching with distance aided selection of donors
### Aliases: mice.impute.midastouch midastouch
### Keywords: mice

### ** Examples

## from R:: mice, slightly adapted ##

# do default multiple imputation on a numeric matrix
library(midastouch)
library(mice)
imp <- mice(nhanes, method = 'midastouch')
imp

# list the actual imputations for BMI
imp$imp$bmi

# first completed data matrix
complete(imp)


# imputation on mixed data with a different method per column

mice(nhanes2, method = c('sample','midastouch','logreg','norm'))



