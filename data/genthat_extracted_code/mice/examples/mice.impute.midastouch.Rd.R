library(mice)


### Name: mice.impute.midastouch
### Title: Imputation by predictive mean matching with distance aided donor
###   selection
### Aliases: mice.impute.midastouch
### Keywords: datagen

### ** Examples

# do default multiple imputation on a numeric matrix
imp <- mice(nhanes, method = 'midastouch')
imp

# list the actual imputations for BMI
imp$imp$bmi

# first completed data matrix
complete(imp)

# imputation on mixed data with a different method per column
mice(nhanes2, method = c('sample', 'midastouch', 'logreg', 'norm'))



