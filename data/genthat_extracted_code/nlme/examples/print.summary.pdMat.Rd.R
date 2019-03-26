library(nlme)


### Name: print.summary.pdMat
### Title: Print a summary.pdMat Object
### Aliases: print.summary.pdMat
### Keywords: models

### ** Examples

pd1 <- pdCompSymm(3 * diag(2) + 1, form = ~age + age^2,
         data = Orthodont)
print(summary(pd1), sigma = 1.2, resid = TRUE)



