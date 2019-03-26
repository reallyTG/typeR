library(Renvlp)


### Name: genv
### Title: Fit the groupwise envelope model
### Aliases: genv

### ** Examples

data(fiberpaper)
X <- fiberpaper[ , c(5, 7)]
Y <- fiberpaper[ , 1:3]
Z <- as.numeric(fiberpaper[ , 6] > mean(fiberpaper[ , 6]))
u <- u.genv(X, Y, Z)
u
m <- genv(X, Y, Z, 2)




