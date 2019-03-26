library(EMMIXmfa)


### Name: print.emmix
### Title: Print Method for Class 'emmix'
### Aliases: print.emmix summary.emmix print.mfa print.mcfa print.mtfa
###   print.mctfa
### Keywords: print

### ** Examples

## No test: 
set.seed(1984)
Y <- scale(iris[, -5])
model <- mcfa(Y, g = 3, q = 3, nkmeans = 1, nrandom = 0, itmax = 100)
#
print(model)
summary(model)
## End(No test)



