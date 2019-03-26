### R code from vignette source 'Introduction-Mixtures.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: prelim
###################################################
library(MixAll)
MixAll.version <- packageDescription("MixAll")$Version
MixAll.date <- packageDescription("MixAll")$Date
set.seed(2)


###################################################
### code chunk number 2: Introduction-Mixtures.Rnw:356-358
###################################################
clusterAlgo()
clusterAlgo(algo="SemiSEM",nbIteration=100,epsilon=1e-08)


###################################################
### code chunk number 3: Introduction-Mixtures.Rnw:388-390
###################################################
clusterInit()
clusterInit(method="random", nbInit= 2, algo="CEM", nbIteration=10,epsilon=1e-04)


###################################################
### code chunk number 4: Introduction-Mixtures.Rnw:468-469
###################################################
clusterStrategy()


###################################################
### code chunk number 5: Introduction-Mixtures.Rnw:485-486
###################################################
clusterFastStrategy()


###################################################
### code chunk number 6: Introduction-Mixtures.Rnw:493-494
###################################################
clusterSemiSEMStrategy()


###################################################
### code chunk number 7: Introduction-Mixtures.Rnw:548-551
###################################################
clusterDiagGaussianNames()
clusterDiagGaussianNames("all", "equal", "free")
clusterValidDiagGaussianNames(c("gaussian_pk_sjk","gaussian_p_ljk"))


###################################################
### code chunk number 8: Introduction-Mixtures.Rnw:578-581
###################################################
clusterCategoricalNames()
clusterCategoricalNames("all", "equal")
clusterValidCategoricalNames(c("categorical_pk_pjk","categorical_p_pk"))


###################################################
### code chunk number 9: Introduction-Mixtures.Rnw:618-621
###################################################
clusterPoissonNames()
clusterPoissonNames("all","proportional")
clusterValidPoissonNames(c("poisson_pk_ljk","poisson_p_ljlk"))


###################################################
### code chunk number 10: Introduction-Mixtures.Rnw:694-697
###################################################
clusterGammaNames()
clusterGammaNames("all", "equal","free","free","all")
clusterValidGammaNames(c("gamma_pk_aj_bk","gamma_p_ajk_bjk"))


###################################################
### code chunk number 11: Introduction-Mixtures.Rnw:785-794
###################################################
data(geyser);
x = as.matrix(geyser); n <- nrow(x); p <- ncol(x);
# add missing values at random
indexes  <- matrix(c(round(runif(10,1,n)), round(runif(10,1,p))), ncol=2);
x[indexes] <- NA;
model <- clusterDiagGaussian(data=x, nbCluster=3, strategy = clusterFastStrategy())
summary(model)
missingValues(model)
plot(model)


###################################################
### code chunk number 12: Introduction-Mixtures.Rnw:828-836
###################################################
data(birds)
x = as.matrix(birds);  n <- nrow(x); p <- ncol(x);
indexes  <- matrix(c(round(runif(10,1,n)), round(runif(10,1,p))), ncol=2);
x[indexes] <- NA;
model <- clusterCategorical(data=x, nbCluster=2)
summary(model)
missingValues(model)
plot(model)


###################################################
### code chunk number 13: Introduction-Mixtures.Rnw:868-876
###################################################
data(geyser);
x = as.matrix(geyser); n <- nrow(x); p <- ncol(x);
indexes  <- matrix(c(round(runif(10,1,n)), round(runif(10,1,p))), ncol=2);
x[indexes] <- NA;
model <- clusterGamma(data=x, nbCluster=3, strategy = clusterFastStrategy())
summary(model)
missingValues(model)
plot(model)


###################################################
### code chunk number 14: Introduction-Mixtures.Rnw:907-913
###################################################
data(DebTrivedi)
dt <- DebTrivedi[1:500, c(1, 6,8, 15)]
model <- clusterPoisson( data=dt, nbCluster=3, strategy = clusterFastStrategy())
summary(model)
missingValues(model)
plot(model)


###################################################
### code chunk number 15: Introduction-Mixtures.Rnw:944-952
###################################################
data(HeartDisease.cat)
data(HeartDisease.cont)
ldata = list(HeartDisease.cat,HeartDisease.cont);
lnames = c("categorical_pk_pjk","gaussian_pk_sjk")
model <- clusterMixedData(ldata, lnames, nbCluster=3, strategy = clusterFastStrategy())
summary(model)
missingValues(model)
plot(model)


###################################################
### code chunk number 16: Introduction-Mixtures.Rnw:988-990
###################################################
clusterAlgoPredict()
clusterAlgo(algo="SemiSEM",nbIteration=100)


###################################################
### code chunk number 17: Introduction-Mixtures.Rnw:1010-1019
###################################################
data(iris)
x = as.matrix(iris[1:4])
indexes <- sample(1:nrow(x), nrow(x)/2)
train <- x[ indexes,]
test  <- x[-indexes,]
model1 <- clusterDiagGaussian( data =train, nbCluster=2:3, models=c( "gaussian_p_sjk"))
## compute prediction for test and compare
model2 <- clusterPredict(test, model1)
table(model2@zi, as.integer(iris$Species[-indexes]))


