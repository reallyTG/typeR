library(vdg)


### Name: meanspv
### Title: Compute Mean Spherical SPV
### Aliases: expmat meanspv

### ** Examples

f1 <- formula(~ x1*x2)
expmat(f1)
f2 <- update(f1, ~ . + I(x1^2) + I(x2^2))
expmat(f2)
f3 <- update(f2, ~ . + I(x2^0.4))
expmat(f3)
f4 <- update(f3, ~ . + I(x1^2):I(x2^2))
expmat(f4)
f5 <- update(f4, ~ . + I(x1^3*x2^0.5))
expmat(f5)



