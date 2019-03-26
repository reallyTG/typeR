library(tsDyn)


### Name: TVAR.sim
### Title: Simulation of a multivariate Threshold Autoregressive model
###   (TVAR)
### Aliases: TVAR.sim TVAR.boot
### Keywords: bootstrap ts

### ** Examples



## TVAR.sim: Simulation of a TVAR with 1 threshold
B <- rbind(c(0.11928245, 1.00880447, -0.009974585, -0.089316, 0.95425564, 0.02592617),
        c(0.25283578, 0.09182279,  0.914763741, -0.0530613, 0.02248586, 0.94309347))
colnames(B) <- paste(rep(c("Const", "Lag_1_var1", "Lag_1_var2"), 2), c("Low", "High"), sep="_")
sim <- TVAR.sim(B=B,nthresh=1,n=500, mTh=1, Thresh=5, starting=matrix(c(5.2, 5.5), nrow=1))

#estimate the new serie
TVAR(sim, lag=1, dummyToBothRegimes=TRUE)






## TVAR.boot: Bootstrap a TVAR with two threshold (three regimes)
data(zeroyld)
serie <- zeroyld
mod <- TVAR(data=serie,lag=1, nthresh=1)
TVAR.boot(mod)



