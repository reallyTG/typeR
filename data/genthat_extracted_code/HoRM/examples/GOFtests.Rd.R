library(HoRM)


### Name: GOF.tests
### Title: Summary of Goodness-of-Fit Tests
### Aliases: GOF.tests
### Keywords: file

### ** Examples
 
## Goodness-of-fit tests for the logistic regression fit to the
## menarche dataset.

data(menarche, package = "MASS")

glm.out = glm(cbind(Menarche, Total - Menarche) ~ Age, 
              family = binomial, data = menarche)
GOF.tests(glm.out)




