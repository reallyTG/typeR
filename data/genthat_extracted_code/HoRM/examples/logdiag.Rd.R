library(HoRM)


### Name: logdiag
### Title: Diagnostic Measures of Certain Regression Estimates
### Aliases: logdiag
### Keywords: file

### ** Examples
 
## Diagnostic summaries for the logistic regression fit to the
## menarche dataset.

data(menarche, package = "MASS")

glm.out = glm(cbind(Menarche, Total - Menarche) ~ Age, 
              family = binomial, data = menarche)
logdiag(glm.out)




