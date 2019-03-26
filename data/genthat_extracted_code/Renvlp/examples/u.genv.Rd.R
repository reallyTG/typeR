library(Renvlp)


### Name: u.genv
### Title: Select the dimension of genv
### Aliases: u.genv

### ** Examples

data(fiberpaper)
X <- fiberpaper[ , c(5, 7)]
Y <- fiberpaper[ , 1:3]
Z <- as.numeric(fiberpaper[ , 6] > mean(fiberpaper[ , 6]))

u <- u.genv(X, Y, Z)
u



