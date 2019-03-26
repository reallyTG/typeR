library(psych)


### Name: residuals.psych
### Title: Extract residuals from various psych objects
### Aliases: residuals.psych resid.psych
### Keywords: multivariate models

### ** Examples

f3 <- fa(Thurstone,3)
residuals(f3)
sum(residuals(f3)^2) #include diagonal
sum(residuals(f3,diag=FALSE)^2,na.rm=TRUE) #drop diagonal



