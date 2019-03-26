library(rrcov)


### Name: Wilks.test
### Title: Classical and Robust One-way MANOVA: Wilks Lambda
### Aliases: Wilks.test Wilks.test.default Wilks.test.data.frame
###   Wilks.test.formula Wilks.test.matrix model.frame.Wilks.test
### Keywords: multivariate robust

### ** Examples

library(MASS)
data(anorexia)
grp <- as.factor(anorexia[,1])
x <- as.matrix(anorexia[,2:3])
##  Using the default interface, classical test
Wilks.test(x, grouping=grp, method="c")

##  Using the default interface, rank based test
Wilks.test(x, grouping=grp, method="rank")

## For this data set: p=2, n=n1+n2+n3=29+26+17
## were computed the following multiplication factor xd and degrees of freedom xq
##  for the MCD estimates with alpha=0.5
xd <-  -0.02162666
xq <- 3.63971
Wilks.test(x, grouping=grp, method="mcd", xd=xd, xq=xq)

## Now the same with the formula interface
Wilks.test(Treat~Prewt+Postwt, data=anorexia, method="mcd", xd=xd, xq=xq)

##Iris data with formula interface
data(iris)
Wilks.test(Species~., data=iris, method="c")

## and with default interface
Wilks.test(iris[,1:4],grouping=iris[,5], method="c")

# hemophilia data - classical, rank and MCD test
data(hemophilia)
hemophilia$gr <- as.factor(hemophilia$gr)

Wilks.test(gr~., data=hemophilia, method="c")
Wilks.test(gr~., data=hemophilia, method="rank")
## already simulated parameters for MCD with alpha=0.5
xd <- -0.01805436
xq <- 1.950301
Wilks.test(gr~., data=hemophilia, xd=xd, xq=xq, method="mcd")




