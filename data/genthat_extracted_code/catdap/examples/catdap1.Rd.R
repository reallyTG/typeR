library(catdap)


### Name: catdap1
### Title: Categorical Data Analysis Program Package 01
### Aliases: catdap1 catdap1c
### Keywords: category

### ** Examples

## example 1 (The Japanese National Character)
data(JNcharacter)
response <- c("born.again", "difficult", "pleasure", "women.job", "money")
catdap1(JNcharacter, response)

# or, simply  
data(JNcharacter)
catdap1(JNcharacter)

## example 2 (Titanic data)
# A data set with 2201 observations on 4 variables (Class, Sex, Age and Survived)
# cross-tabulating data
catdap1c(Titanic, "Survived")

# individual data
x <- data.frame(Titanic)
y <- data.matrix(x)
n <- dim(y)[1]
nc <- dim(y)[2]
z <- array(, dim = c(nc-1, sum(y[, 5])))
k <- 1
for (i in 1:n)
  if (y[i, nc] != 0) {
    np <- y[i, nc]
    for (j in 1:(nc-1))
      z[j, k:(k+np-1)] <- dimnames(Titanic)[[j]][[y[i, j]]]
    k <- k + np
  }
data <- data.frame(aperm(array(z, dim = c(4,2201)), c(2,1)))
names(data) <- names(dimnames(Titanic))
catdap1(data, "Survived")



