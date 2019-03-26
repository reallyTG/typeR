library(rmutil)


### Name: tvctomat
### Title: Create a Time-varying, Intra-individual Covariate (tvcov) Object
### Aliases: tvctomat
### Keywords: manip

### ** Examples

z <- matrix(rpois(20,5),ncol=5)
print(tvc <- tvctomat(z, units="days"))
covariates(tvc)
names(tvc)
v <- data.frame(matrix(rep(c("a","b","c","d","e"),4),ncol=5))
print(tvc2 <- tvctomat(v, oldtvc=tvc, units=NA))
covariates(tvc2)
print(tvc3 <- tvctomat(v, oldtvc=tvc, dataframe=FALSE, units=NA))
covariates(tvc3)
print(tvc4 <- tvctomat(tvc2, interaction=c("z","v")))
covariates(tvc4)
x1 <- 1:4
x2 <- gl(4,1)
xx <- tcctomat(data.frame(x1,x2), dataframe=FALSE)
tvctomat(tvc3, interaction="z", ccov=xx)
tvctomat(tvc3, interaction="z", ccov=xx, names="x1")
tvctomat(tvc3, interaction="z", ccov=xx, names=c("x22","x23","x24"))
xx <- tcctomat(data.frame(x1,x2), dataframe=TRUE)
tvctomat(tvc2, interaction="z", ccov=xx)
tvctomat(tvc2, interaction="z", ccov=xx, names="x1")
tvctomat(tvc2, interaction="z", ccov=xx, names="x2")



