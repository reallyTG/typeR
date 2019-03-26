library(mixreg)


### Name: mixreg
### Title: Fit a mixture of linear regressions.
### Aliases: mixreg
### Keywords: models regression

### ** Examples

data(aphids)
x   <- aphids$n.aphids
y   <- aphids$n.inf
TS  <- list(list(beta=c(3.0,0.1),sigsq=16,lambda=0.5),
            list(beta=c(0.0,0.0),sigsq=16,lambda=0.5))
fit <- mixreg(x,y,ncomp=2,theta.start=TS,data.name='aphids')
cvm <- covmix(fit,x,y)
cbd <- cband(fit,cvm,x,y)
plot(cbd)
r <- residMix(fit,x,y)
plot(r)
r <- residMix(fit,x,y,std=TRUE)
qqMix(r)



