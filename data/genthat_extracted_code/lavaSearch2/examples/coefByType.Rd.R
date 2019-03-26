library(lavaSearch2)


### Name: coefByType
### Title: Extract the Coefficient by Type
### Aliases: coefByType coefCov coefCov.lvm coefCov.lvmfit
###   coefCov.multigroup coefExtra coefExtra.lvm coefExtra.lvmfit
###   coefExtra.multigroup coefIndexModel coefIndexModel.lvm
###   coefIndexModel.lvmfit coefIndexModel.multigroup
###   coefIndexModel.multigroupfit coefIntercept coefIntercept.lvm
###   coefIntercept.lvmfit coefIntercept.multigroup coefRef coefRef.lvmfit
###   coefReg coefReg.lvm coefReg.lvmfit coefReg.multigroup coefVar
###   coefVar.lvm coefVar.lvmfit coefVar.multigroup

### ** Examples

#### regression ####
m <- lvm(Y~X1+X2)
e <- estimate(m, lava::sim(m, 1e2))

coefCov(m)
coefCov(m, value = TRUE)

coefCov(m, keep.var = TRUE)
coefCov(m, value = TRUE, keep.var = TRUE)

coefIndexModel(m)
coefIndexModel(e)

coefIntercept(m)
coefIntercept(m, value = TRUE)

coefReg(m)
coefReg(m, value = TRUE)

#### LVM ####
m <- lvm()
regression(m) <- c(y1,y2,y3)~u
regression(m) <- u~x1+x2
latent(m) <- ~u
covariance(m) <- y1~y2

m.Sim <- m
categorical(m.Sim, labels = c("a","b","c")) <- ~x2
e <- estimate(m, lava::sim(m.Sim, 1e2))

coefCov(m)
coefCov(m, value = TRUE) 

coefCov(m, keep.var = TRUE)
coefCov(m, value = TRUE, keep.var = TRUE)

coefExtra(m)

coefIndexModel(m)
coefIndexModel(e)

## additional categorical variable 
categorical(m, labels = as.character(1:3)) <- "X1"

coefExtra(m)
coefExtra(m, value = TRUE)

## additional categorical variable
categorical(m, labels = as.character(1:3)) <- "x1"

coefIntercept(m)
coefIntercept(m, value = TRUE)
coefIntercept(e)

coefReg(e, value = TRUE)

#### multigroup ####
m <- lvm(Y~X1+X2)
eG <- estimate(list(m,m), list(lava::sim(m, 1e2), lava::sim(m, 1e2)))

coefIndexModel(eG)




