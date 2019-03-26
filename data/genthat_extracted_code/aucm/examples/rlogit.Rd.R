library(aucm)


### Name: rlogit
### Title: rlogit
### Aliases: rlogit coef.rlogit predict.rlogit ratio.rlogit trainauc.rlogit
###   logistic.f

### ** Examples


set.seed(1)
x0 <- matrix(rnorm(100,1))
y  <- as.numeric(runif(100)>0.5)        # numeric(runif(100)>0.5)
dat=data.frame(y=y, x=x0)
rlogit(y~x, dat)







