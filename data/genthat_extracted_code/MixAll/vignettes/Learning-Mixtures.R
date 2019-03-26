### R code from vignette source 'Learning-Mixtures.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: prelim
###################################################
library(MixAll)
MixAll.version <- packageDescription("MixAll")$Version
MixAll.date <- packageDescription("MixAll")$Date
set.seed(2)


###################################################
### code chunk number 2: Learning-Mixtures.Rnw:216-225
###################################################
data(iris);
x <- as.matrix(iris[,1:4]); z <- as.vector(iris[,5]); n <- nrow(x); p <- ncol(x);
indexes <- matrix(c(round(runif(5,1,n)), round(runif(5,1,p))), ncol=2);
cbind(indexes, x[indexes]) # display true values
x[indexes] <- NA;          # set them as missing
model <- learnDiagGaussian(data=x, labels = z, models = clusterDiagGaussianNames(prop = "equal"))
summary(model)
missingValues(model)
plot(model)


###################################################
### code chunk number 3: Learning-Mixtures.Rnw:236-248
###################################################
data(birds)
## add 10 missing values
x <- as.matrix(birds[,2:5]); z <- as.vector(birds[,1]); n <- nrow(x); p <- ncol(x);
indexes <- matrix(c(round(runif(5,1,n)), round(runif(5,1,p))), ncol=2);
cbind(indexes, x[indexes]) # display true values
x[indexes] <- NA;          # set them as missing
model <- learnCategorical( data=x, labels=z
                         , models = clusterCategoricalNames(prop = "equal")
                         , algo="simul", nbIter = 2)
summary(model)
missingValues(model)
plot(model)


###################################################
### code chunk number 4: Learning-Mixtures.Rnw:258-270
###################################################
data(iris)
x <- as.matrix(iris[,1:4]); z <- as.vector(iris[,5]); n <- nrow(x); p <- ncol(x);
indexes <- matrix(c(round(runif(5,1,n)), round(runif(5,1,p))), ncol=2);
cbind(indexes, x[indexes]) # display true values
x[indexes] <- NA;          # set them as missing
model <- learnGamma( data=x, labels= z,
                    , models = clusterGammaNames(prop = "equal")
                    , algo = "simul", nbIter = 2, epsilon = 1e-08
                )
summary(model)
missingValues(model)
plot(model)


###################################################
### code chunk number 5: Learning-Mixtures.Rnw:280-292
###################################################
data(DebTrivedi)
x <- DebTrivedi[, c(1, 6, 8, 15)]; z <- DebTrivedi$medicaid; n <- nrow(x); p <- ncol(x);
indexes <- matrix(c(round(runif(5,1,n)), round(runif(5,1,p))), ncol=2);
cbind(indexes, x[indexes]) # display true values
x[indexes] <- NA;          # set them as missing
model <- learnPoisson( data=x, labels=z
                     , models = clusterPoissonNames(prop = "equal")
                     , algo="simul", nbIter = 2, epsilon =  1e-08
)
summary(model)
missingValues(model)
plot(model)


###################################################
### code chunk number 6: Learning-Mixtures.Rnw:324-334
###################################################
data(HeartDisease.cat)
data(HeartDisease.cont)
data(HeartDisease.target)
ldata = list(HeartDisease.cat, HeartDisease.cont);
models = c("categorical_pk_pjk","gaussian_pk_sjk")
z<-HeartDisease.target[[1]];
model <- learnMixedData(ldata, models, z, algo="simul", nbIter=2)
summary(model)
missingValues(model)
plot(model)


