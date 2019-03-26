library(aucm)


### Name: grid.auc
### Title: grid.auc
### Aliases: eauc grid.auc plot.gridsearch vcov.gridsearch

### ** Examples


library(aucm)

dat = sim.dat.1(n=200,seed=1)
beta=cbind(4, 4*seq(-1,0,length=100))
dim(beta)

par(mfrow=c(3,2))

out1 = grid.auc (y~x1+x2, dat, beta, approx.param=1, loss=FALSE, t0=NULL, t1=NULL, lambda=0, 
    approx.type="rauc")
plot(out1$pars[2,]/out1$pars[1,],out1$vals,type="l",xlab=expression(beta[2]/beta[1]),main="RAUC")

# penalized RAUC
out2 = grid.auc (y~x1+x2, dat, beta, approx.param=1, loss=TRUE, t0=NULL, t1=NULL, lambda=0, 
    approx.type="rauc")
out3 = grid.auc (y~x1+x2, dat, beta, approx.param=1, loss=TRUE, t0=NULL, t1=NULL, lambda=30, 
    approx.type="rauc")
plot(out2$pars[2,]/out2$pars[1,],out2$vals,type="l",xlab=expression(beta[2]/beta[1]),
    main="penalized RAUC loss")
lines(out3$pars[2,]/out3$pars[1,],out3$vals,type="l",col=2)
out2$par
out3$par

# pRAUC
out4 = grid.auc (y~x1+x2, dat, beta, approx.param=1, loss=FALSE, t0=0, t1=0.5, lambda=0, 
    approx.type="rauc")
out5 = grid.auc (y~x1+x2, dat, beta, approx.param=1, loss=FALSE, t0=0.5, t1=1, lambda=0, 
    approx.type="rauc")
plot(out4$pars[2,]/out4$pars[1,],out4$vals,type="l",xlab=expression(beta[2]/beta[1]),main="pRAUC")
plot(out5$pars[2,]/out5$pars[1,],out5$vals,type="l",xlab=expression(beta[2]/beta[1]),main="pRAUC")
out4$par
out5$par


# penalized pRAUC
out6 = grid.auc (y~x1+x2, dat, beta, approx.param=1, loss=TRUE, t0=0, t1=0.5, lambda=0, 
    approx.type="rauc")
out7 = grid.auc (y~x1+x2, dat, beta, approx.param=1, loss=TRUE, t0=0, t1=0.5, lambda=10, 
    approx.type="rauc")
plot(out6$pars[2,]/out6$pars[1,],out6$vals,type="l",xlab=expression(beta[2]/beta[1]),
    main="penalized pRAUC loss")
lines(out7$pars[2,]/out7$pars[1,],out7$vals,type="l",col=2)
out3$par
out7$par

fit = eauc(y~x1+x2, dat)




