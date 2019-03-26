library(survAUC)


### Name: schemper
### Title: Distance-based estimator of survival predictive accuracy
###   proposed by Schemper and Henderson
### Aliases: schemper
### Keywords: classif

### ** Examples


library(rms)
ovarian$time <- ovarian$futime
ovarian$status <- ovarian$fustat
set.seed(2011)
trobs <- sample(1:26,16)
TR <- ovarian[trobs,]
TE <- ovarian[-trobs,]
train.fit  <- cph(Surv(time, status) ~ age,
                  x=TRUE, y=TRUE, method="breslow", data=TR)

schemper(train.fit, TR, TE)




