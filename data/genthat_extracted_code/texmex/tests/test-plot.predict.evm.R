context("plot.predict.evm")

test_that("plot.predict.evm behaves as it should", {
  skip_on_cran()
  skip_on_travis()
    # testing all of: plot.lp.evm* and plot.rl.evm* where * is opt, sim and boot
  
  # first with no covariates
  n <- 100
  for(Family in list(gpd,gev)){
    set.seed(20130513)
    pst <- function(msg) texmexPst(msg,Family=Family)
    
    u    <- switch(Family$name,GPD=14,GEV=-Inf)
    data <- switch(Family$name,GPD=rain,GEV=portpirie$SeaLevel)
    
    fit.opt <- evm(data,th=u,family=Family)
    fit.sim <- evm(data,th=u,method="sim",trace=100000,family=Family)
    fit.boot <- evmBoot(fit.opt,R=20,trace=30)
    
    M <- seq(20,1000,len=20)
    
    p.opt <- predict(fit.opt,M=M,ci=TRUE)
    p.sim <- predict(fit.sim,M=M,ci=TRUE)
    p.boot <- predict(fit.boot,M=M,ci=TRUE)
    
    par(mfrow=c(3,3))
    plot(p.opt,main=paste(Family$name,"\nMLE"))
    plot(p.sim,main=paste(Family$name,"\nMCMC"))
    plot(p.boot,main=paste(Family$name,"\nBootstrap"))
    
    p.lp.opt <- predict(fit.opt,type="lp",ci=TRUE)
    p.lp.sim <- predict(fit.sim,type="lp",ci=TRUE)
    p.lp.boot <- predict(fit.boot,type="lp",ci=TRUE)
    
    expect_that(plot(p.lp.opt), throws_error(), label=pst("plot.lp.evmOpt: fail if no covariates"))
    expect_that(plot(p.lp.sim), throws_error(), label=pst("plot.lp.evmSim: fail if no covariates"))
    expect_that(plot(p.lp.boot), throws_error(), label=pst("plot.lp.evmBoot: fail if no covariates"))
    
    # now with covariates
    
    n <- 1000
    M <- 1000
    
    mu <- 1
    
    X <- data.frame(a = rnorm(n),b = runif(n,-0.1,0.1))
    param <- switch(Family$name,GPD=cbind(X[,1],X[,2]),GEV=cbind(mu,X[,1],X[,2]))
    th <- switch(Family$name,GPD=0,GEV=-Inf)
    X$Y <- Family$rng(n,param,list(threshold=th))
    start <- switch(Family$name,GPD=c(0,1,0,1),GEV=c(mu,0,1,0,1))
    
    fit.opt <- evm(Y,data=X,phi=~a,xi=~b, th=th,family=Family,start=start)
    fit.sim <- evm(Y,data=X,phi=~a,xi=~b, th=th,family=Family,method="sim",trace=100000,start=start)
    o <- options(warn=-1)
    fit.boot <- evmBoot(fit.opt,R=20,trace=30)
    options(o)
    
    nx <- 3
    M <- seq(5,1000,len=20)
    newX <- data.frame(a=rnorm(nx),b=runif(nx,-0.1,0.1))
    
    p.opt <- predict(fit.opt,M=M,newdata=newX,ci=TRUE)
    p.sim <- predict(fit.sim,M=M,newdata=newX,ci=TRUE)
    p.boot <- predict(fit.boot,M=M,newdata=newX,ci=TRUE)
    
    p.lp.opt <- predict(fit.opt,type="lp",newdata=newX,ci=TRUE)
    p.lp.sim <- predict(fit.sim,type="lp",newdata=newX,ci=TRUE)
    p.lp.boot <- predict(fit.boot,type="lp",newdata=newX,ci=TRUE)
    
    par(mfrow=c(3,3))
    plot(p.opt,sameAxes=FALSE,main=paste(Family$name,"MLE\ndifferent axes"))
    plot(p.sim,sameAxes=FALSE,main=paste(Family$name,"MCMC\ndifferent axes"))
    plot(p.boot,sameAxes=FALSE,main=paste(Family$name,"Bootstrap\ndifferent axes"))
    
    plot(p.opt,sameAxes=TRUE,main=paste(Family$name,"MLE\nsame axes"))
    plot(p.sim,sameAxes=TRUE,main=paste(Family$name,"MCMC\nsame axes"))
    plot(p.boot,sameAxes=TRUE,main=paste(Family$name,"Bootstrap\nsame axes"))
    
    par(mfrow=c(4,4))
    plot(p.lp.opt,main=paste(Family$name,"MLE"))
    plot(p.lp.sim,main=paste(Family$name,"MCMC\nmean"),type="mean")
    plot(p.lp.sim,main=paste(Family$name,"MCMC\nmedian"),type="median")
    plot(p.lp.boot,main=paste(Family$name,"Bootstrap"))
    
    # single covariate only:
    
    param <- switch(Family$name,GPD=cbind(X[1,1],X[,2]),GEV=cbind(mu,X[1,1],X[,2]))
    X$Y <- Family$rng(n,param,list(threshold=th))
    fit.opt <- evm(Y,data=X,xi=~b,th=th,family=Family)
    fit.sim <- evm(Y,data=X,xi=~b,th=th,family=Family,method="sim",trace=100000)
    o <- options(warn=-1)
    fit.boot <- evmBoot(fit.opt,R=20,trace=30)
    options(o)
    
    p.opt <- predict(fit.opt,M=M,newdata=newX,ci=TRUE)
    p.sim <- predict(fit.sim,M=M,newdata=newX,ci=TRUE)
    p.boot <- predict(fit.boot,M=M,newdata=newX,ci=TRUE)
    
    p.lp.opt <- predict(fit.opt,type="lp",newdata=newX,ci=TRUE)
    p.lp.sim <- predict(fit.sim,type="lp",newdata=newX,ci=TRUE)
    p.lp.boot <- predict(fit.boot,type="lp",newdata=newX,ci=TRUE)
    
    par(mfrow=c(3,3))
    plot(p.opt,sameAxes=FALSE,main=paste(Family$name,"MLE"))
    plot(p.sim,sameAxes=FALSE,main=paste(Family$name,"MCMC"))
    plot(p.boot,sameAxes=FALSE,main=paste(Family$name,"Bootstrap"))
    
    par(mfrow=c(3,1))
    plot(p.lp.opt,main=paste(Family$name,"MLE"),polycol="cyan")
    plot(p.lp.sim,main=paste(Family$name,"MCMC"),polycol="cyan")
    plot(p.lp.boot,main=paste(Family$name,"Bootstrap"),polycol="cyan")
  }
}
)
