library(NonpModelCheck)


### Name: group.npvarselec
### Title: Group variable selection for nonparametric regression
### Aliases: group.npvarselec
### Keywords: ~kwd1 ~kwd2

### ** Examples

groups = vector("list",7)

groups[[1]] = c(3,8,5,12,14)
groups[[2]] = c(6,7,9,10)
groups[[3]] = 13
groups[[4]] = c(1,2,4,11)
groups[[5]] = c(15,16, 20)
groups[[6]] = 17
groups[[7]] = c(18,19)

X = matrix(1,100,20)
for (i in 1:20)
X[,i] = rnorm(100)

Y = X[,13]^3 + X[,7] + X[,15]^2 + X[,16] + rnorm(100)

group.npvarselec(X,Y,groups)




