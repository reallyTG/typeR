library(sivipm)


### Name: sivipm
### Title: Sensitivity Indices
### Aliases: sivipm

### ** Examples

X <- cornell0[,1:3] # X-inputs
Y <- as.data.frame( cornell0[,8]) # response variable
# Creation of the polynomial:
P <- vect2polyX(X, c("1", "2", "3", "3*3*3"))
# Compute total sensitivity indices:
A <- sivipm(Y, P, options=c("tsivip"))
# See the names of the returned components
getNames(A)
# The main results
summary(A)
# All the results
print(A, all=TRUE)
# Calculation by using the fast algorithm:
B <- sivipm(Y, P, fast = TRUE, options=c("tsivip"))



