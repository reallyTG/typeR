library(impimp)


### Name: checkImprecision
### Title: Imprecise Imputation
### Aliases: checkImprecision

### ** Examples

A <- data.frame(x1 = c(1,0), x2 = c(0,0),
                y1 = c(1,0), y2 = c(2,2))
B <- data.frame(x1 = c(1,1,0), x2 = c(0,0,0),
                z1 = c(0,1,1), z2 = c(0,1,2))
AimpB <- impimp(A, B, method = "variable_wise")
BimpA <- impimp(B, A, method = "variable_wise")
AB <- rbindimpimp(AimpB, BimpA)
checkImprecision(AB)

## No test: 
data(iris)
checkImprecision(iris) # emits a warning
## End(No test)



