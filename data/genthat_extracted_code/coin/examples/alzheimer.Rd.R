library(coin)


### Name: alzheimer
### Title: Smoking and Alzheimer's Disease
### Aliases: alzheimer
### Keywords: datasets

### ** Examples

## Spineplots
op <- par(no.readonly = TRUE) # save current settings
layout(matrix(1:2, ncol = 2))
spineplot(disease ~ smoking, data = alzheimer,
          subset = gender == "Male", main = "Male")
spineplot(disease ~ smoking, data = alzheimer,
          subset = gender == "Female", main = "Female")
par(op) # reset

## Asymptotic Cochran-Mantel-Haenszel test
cmh_test(disease ~ smoking | gender, data = alzheimer)



