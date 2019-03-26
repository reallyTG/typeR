library(nsRFA)


### Name: REGRDIAGNOSTICS
### Title: Diagnostics of regressions
### Aliases: REGRDIAGNOSTICS R2.lm prt.lm mantel.lm vif.lm RMSE.lm MAE.lm
###   predinterval.lm jackknife1.lm RMSEjk.lm MAEjk.lm
### Keywords: regression

### ** Examples

data(hydroSIMN)

D <- annualflows["dato"][,]
cod <- annualflows["cod"][,]

#Dm <- tapply(D,cod,mean)
#datregr <- cbind(Dm,parameters)
datregr <- parameters
regr0 <- lm(Dm ~ .,datregr); summary(regr0)
regr1 <- lm(Dm ~ Am + Hm + Ybar,datregr); summary(regr1)

R2.lm(regr0)
R2.lm(regr1)

prt.lm(regr0)
prt.lm(regr1)

vif.lm(regr0)
vif.lm(regr1)

RMSE.lm(regr0)
RMSE.lm(regr1)

MAE.lm(regr0)
MAE.lm(regr1)

predinterval.lm(regr0)

jackknife1.lm(regr0)
jackknife1.lm(regr1)

RMSEjk.lm(regr0)
RMSEjk.lm(regr1)

MAEjk.lm(regr0)
MAEjk.lm(regr1)

# mantel test on distance matrices
#Y <- AD.dist(D,cod)             # it takes some time
#X <- data.frame(apply(datregr[,c("Hm","Ybar")],2,dist))
#dati <- cbind(X)
#modello <- lm(Y ~ Hm + Ybar, dati)
#mantel.lm(modello, Nperm=100)




