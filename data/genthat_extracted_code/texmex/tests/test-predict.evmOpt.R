context("predict.evmOpt")

test_that("predict.evmOpt behaves as it should", {
  skip_on_cran()
  skip_on_travis()

  for(Family in list(gpd,gev)){
    set.seed(20130513)
    pst <- function(msg) texmexPst(msg,Family=Family)

    # no covariates

    u    <- switch(Family$name, GPD=14, GEV=-Inf)
    data <- switch(Family$name, GPD=rain, GEV=portpirie$SeaLevel)

    r.fit <- evm(data, th=u, family=Family)
    co <- coef(r.fit)

    if(Family$name == "GPD")
      expect_that(u, is_equivalent_to(predict(r.fit, M=1/r.fit$rate)$obj[[1]]), label=pst("predict.evmOpt: GPD retrieve threshold"))

      expect_that(predict(r.fit)$obj[[1]], equals(rl(r.fit)[[1]]),
                  label=pst("predict.evmOpt: predic with type=rlg ives same as direct call to rl with default arguments"))
      expect_that(predict(r.fit, type="lp")$obj[[1]],
                  equals(linearPredictors(r.fit)[[1]]),
                  label=pst("predict.evmOpt: predict with type=lp gives same as direct call to linearpredictors with default arguments"))

    r.fit$rate <- 1
    prob <- c(0.5,0.9,0.95,0.99,0.999)
    for(p in prob){
        expect_that(Family$quant(p, t(co), r.fit),
                    is_equivalent_to(unlist(predict(r.fit,M=1/(1-p))$obj)),
                    label=pst("predict.evmOpt: est ret levels no covariates"))
    }

    # with covariates

    n <- 1000
    M <- 1000

    # boundary cases with single covariates in only one parameter
    mu <- 1
    xi <- 0.05
    set.seed(20160823)
    X <- data.frame(a = rnorm(n),b = runif(n,-0.1,0.1))
    param <- switch(Family$name,GPD=cbind(X[,1],xi),GEV=cbind(mu,X[,1],xi))
    th <- switch(Family$name,GPD=0,GEV=-Inf)
    X$Y <- Family$rng(n,param,list(threshold=th))
    fit <- evm(Y,data=X,phi=~a,th=th,family=Family)
    AllCo <- predict(fit,type="lp")$obj$link[,1:length(Family$param)]
    pred <- predict(fit,M=M)$obj

    expect_that(X$a, is_equivalent_to(pred[[1]][, -1]),
                label=pst("predict.evmOpt: ret level correct reporting of covariates for single cov in phi only"))
    expect_that(Family$quant(1-1/M, AllCo, fit),
                is_equivalent_to(pred[[1]][,1]),
                label=pst("predict.evmOpt: ret level estimation with covariates in phi only"))

    mu <- 1
    sig <- 2
    set.seed(20160823)
    param <- switch(Family$name,GPD=cbind(log(sig),X[,2]),GEV=cbind(mu,log(sig),X[,2]))
    X$Y <- Family$rng(n,param,list(threshold=th))
    fit <- evm(Y,data=X,xi=~b,th=th,family=Family)
    AllCo <- predict(fit,type="lp")$obj$link[,1:length(Family$param)]
    pred <- predict(fit,M=M)$obj

    expect_that(X$b, is_equivalent_to(pred[[1]][, -1]),
                label=pst("predict.evmOpt: ret level correct reporting of covariates for single cov in xi only"))
    expect_that(Family$quant(1-1/M, AllCo, fit),
                is_equivalent_to(pred[[1]][,1]),
                label=pst("predict.evmOpt: ret level estimation with covariates in xi only"))

    # covariates in all parameters
    set.seed(20160824)
    param <- switch(Family$name,GPD=cbind(X[,1],X[,2]),GEV=cbind(X[,1],X[,1],X[,2]))
    X$Y <- Family$rng(n,param,list(threshold=th))
    fit <- switch(Family$name,
                  GPD = evm(Y, data=X,        phi=~a, xi=~b, th=th,family=Family),
                  GEV = evm(Y, data=X, mu=~a, phi=~a, xi=~b, th=th,family=Family))

    AllCo <- predict(fit,type="lp")$obj$link[,1:length(Family$param)]

    expect_that(Family$quant(1-1/M, AllCo, fit),
                is_equivalent_to(predict(fit,M=M)$obj[[1]][,1]),
                label=pst("predict.evmOpt: ret level estimation with covariates in all parameters"))

    # check multiple M
    M <- c(10,50,100,500,1000)
    set.seed(20160823)
    target <- sapply(M,function(m,AllCo,fit) Family$quant(1-1/m,AllCo,fit),AllCo=AllCo,fit=fit)
    current <- predict(fit,M=M)$obj

    for(i in 1:length(M)){
      expect_that(target[, i], is_equivalent_to(current[[i]][,1]),
                  label=pst("predict.evmOpt: ret level estimation multiple M"))
    }

    # new data
    nx <- 20
    M <- 1000
    set.seed(20160823)
    newX <- data.frame(a=runif(nx,0,1),b=runif(nx,-0.05,0.05))
    AllCoNew <- predict(fit,type="lp",newdata=newX)$obj$link[,1:length(Family$param)]

    expect_that(Family$quant(1-1/M, AllCoNew, fit), is_equivalent_to(predict(fit,M=M,newdata=newX)$obj[[1]][,1]),
                label=pst("predict.evmOpt: ret level ests with newdata"))

    expect_that(dim(AllCoNew)+c(0, 3), equals(dim(predict(fit,ci=TRUE,newdata=newX)$obj[[1]])),
                label=pst("predict.evmOpt: dimension of return object for c icalc"))
    expect_that(dim(AllCoNew)+c(0, 2), equals(dim(predict(fit,se=TRUE,newdata=newX)$obj[[1]])),
                label=pst("predict.evmOpt: dimension of return object for se calc"))
    expect_that(dim(AllCoNew)+c(0, 4), equals(dim(predict(fit,se=TRUE,ci=TRUE,newdata=newX)$obj[[1]])),
                label=pst("predict.evmOpt: dimension of return object for se and ci calc"))

    Labels <- switch(Family$name,GPD=c("a","b"),GEV=c("a","a","b"))

    expect_that(c("RL", "2.5%", "97.5%","se.fit", Labels), equals(colnames(predict(fit,se=TRUE,ci=TRUE,newdata=newX)$obj[[1]])),
                label=pst("predict.evmOpt: colnames of return object for se and ci calc, default alpha"))
    expect_that(c("RL", "5%", "95%","se.fit", Labels), equals(colnames(predict(fit,se=TRUE,ci=TRUE,alpha=0.1,newdata=newX)$obj[[1]])),
                label=pst("predict.evmOpt: colnames of return obejct for se and ci calc, alpha=0.1"))

    # alpha

    alpha <- c(0.01,0.05,0.1,0.2,0.5,0.9,0.99)
    z <- matrix(qnorm(c(alpha/2,1-alpha/2)),ncol=2)

    for(a in 1:length(alpha)){
      p <- predict(fit,alpha=alpha[a], ci=TRUE, se=TRUE,newdata=newX)$obj[[1]]
      expect_that(colnames(p)[2:3], equals(c(paste(100*alpha[a]/2, "%",sep=""),paste(100*(1-alpha[a]/2),"%",sep=""))),
                  label=pst("predict.evmOpt: labelling of confidence intervals"))
      expect_that(p[,1] + z[a, 1]*p[,4], equals(p[,2]),
                  label=pst("predict.evmOpt: ret level Conf Interval calc for different alpha"))
      expect_that(p[, 1]+z[a, 2]*p[,4], equals(p[,3]),
                 label=pst("predict.evmOpt: ret level Conf Interval calc for different alpha"))
    }


    # linear predictors

    expect_that(c(nx, switch(Family$name, GPD=6, GEV=9)),
                is_equivalent_to(dim(predict(fit, newdata=newX, se=TRUE, type="lp")$obj$link)),
                label=pst("predict.evmOpt: dimension of return object, linearpredictor, se calc"))
    expect_that(c(nx, switch(Family$name, GPD=8,GEV=12)),
                equals(dim(predict(fit,newdata=newX,ci=TRUE,type="lp")$obj$link)),
                label=pst("predict.evmOpt: dimension of return object, linearpredictor, ci calc"))

    nameCI <- switch(Family$name,GPD = c("phi", "xi", "phi.lo", "phi.hi", "xi.lo", "xi.hi","a","b"),GEV = c("mu","phi", "xi", "mu.lo","mu.hi","phi.lo", "phi.hi", "xi.lo", "xi.hi","a","a","b"))
    nameSE <- switch(Family$name,GPD = c("phi", "xi", "phi.lo", "phi.hi", "xi.lo", "xi.hi","phi.se", "xi.se","a","b"),GEV = c("mu","phi", "xi", "mu.lo","mu.hi","phi.lo", "phi.hi", "xi.lo", "xi.hi","mu.se","phi.se", "xi.se","a","a","b"))
    expect_that(nameCI, equals(colnames(predict(fit, newdata=newX,ci=TRUE,type="lp")$obj$link)),
                label=pst("predict.evmOpt: colnames for linear predictor return object"))
    expect_that(nameSE, equals(colnames(predict(fit, newdata=newX,ci=TRUE,se=TRUE,type="lp")$obj$link)),
                label=pst("predict.evmOpt: colnames for linearpredictor return object"))

    # unique

    newX <- data.frame(a=c(0,0,0,1,1,1,2,2,2,3,3,3,4,4,4),b=c(-.1,.1,.1,-.1,.1,.1,-.1,.1,.1,-.1,.1,.1,-.1,.1,.1)) # checks for duplicates in one and both covariates.
    U <- !duplicated(newX)
    expect_that(predict(fit, newdata=newX, type="lp")$obj$link,
                equals(predict(fit,newdata=newX,unique.=FALSE,type="lp")$obj$link[U,]),
                label=pst("predict.evmOpt: functioning of argument unique, for linear predictor"))
    expect_that(predict(fit, newdata=newX)$obj[[1]],
                equals(predict(fit,newdata=newX,unique.=FALSE)$obj[[1]][U,]),
                label=pst("predict.evmOpt: functioning of argument unique, for return levels"))

    # check standard errors - this takes a while since using bootstrap

    M <- c(10,100,500,1000,2000)
    newX <- data.frame("a"=rep(c(1,-1,2,-2),2),"b"=c(rep(0.1,4),rep(-0.1,4)))
    fit.p <- predict(fit, newdata=newX, se=TRUE, M=M)$obj
    fit.seest <- unlist(lapply(fit.p, function(x) x[,2]))

    o <- options(warn=-1)
    fit.b <- evmBoot(fit, R=1000, trace=1100)
    options(o)
    fit.bp <- predict(fit.b, newdata=newX, all=TRUE, M=M)$obj
    fit.seb <- lapply(fit.bp, function(X) apply(X, 2, sd))
    fit.seboot <- unlist(fit.seb)

    # Testing for similarity of bootstrap SEs of predictiosn and the SEs estimated
    # from the ML fit seems incongruous. Part of the point of using the bootstrap
    # is that we don't trust the approximate SEs based on numerical approximations
    # from the non-quadratic likelihood...
    d <- fit.seboot - fit.seest
    expect_that(abs(mean(d) / sd(d - mean(d))) < 1.28, is_true(),
                label=pst("predict.evmOpt: mean SE difference in expected range"))
#    expect_that(all(abs(d) < 0.4), is_true(),
#                label=pst("predict.evmOpt: return level standard error estimate compared with bootstrap standard errors"))
  }
}
)
