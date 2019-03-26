context("predict.evmBoot")

test_that("predict.evmBoot behaves as it should", {
  skip_on_cran()
  skip_on_travis()
    # functionality all tested already in test.predict.evm, so just check output of correct format.

  n <- 1000
  nx <- 9
  R <- 10
  nm <- 20

  for(Family in list(gpd,gev)){

    pst <- function(msg) texmexPst(msg,Family=Family)
    set.seed(20130513)

    X <- data.frame(a = rnorm(n),b = runif(n,-0.1,0.1))
    param <- switch(Family$name,GPD=X,GEV=cbind(5,X))
    th <- switch(Family$name,GPD=0,GEV=-Inf)
    X$Y <- Family$rng(n,param,list(threshold=th))
    fit <- evm(Y,data=X,phi=~a,xi=~b,th=th,family=Family)

    o <- options(warn=-1)
    boot <- evmBoot(fit,R=R,trace=100)
    options(o)

    newX <- data.frame(a=runif(nx,0,5),b=runif(nx,-0.1,0.5))
    from <- 10; to <- 500
    M <- seq(from,to,length=nm)
    pred <- predict(boot,newdata=newX,M=M,ci=TRUE)

    expect_that(predict(boot)$obj[[1]], equals(rl(boot)[[1]]),
                label=pst("predict.evmBoot: predict with type=rl gives same as direct call to rl with default arguments"))
    expect_that(predict(boot, type="lp")$obj[[1]], equals(linearPredictors(boot)[[1]]),
                label=pst("predict.evmBoot: predict with type=lp gives same as direct call to linearPredictors with default arguments"))

    expect_that(nm, equals(length(pred$obj)), label=pst("predict.evmBoot: output length"))
    expect_that(paste("M.", from, sep=""), equals(names(pred$obj)[1]), label=pst("predict.evmBoot: names of output"))
    expect_that(paste("M.", to, sep=""), equals(names(pred$obj)[nm]), label=pst("predict.evmBoot: names of output"))

    cnames <- c( "Mean","50%","2.5%","97.5%",names(X)[1:2])
    expect_that(cnames, equals(colnames(pred$obj[[1]])), label=pst("predict.evmBoot: colnames"))

    expect_that(c(nx, 6), equals(dim(pred$obj[[1]])), label=pst("predict.evmBoot: dimension"))
    for(i in 1:nm){
      expect_that(unname(newX[, 1]), equals(unname(pred$obj[[i]][,5])), label=pst("predict.evmBoot: covariates in output"))
      expect_that(unname(newX[, 2]), equals(unname(pred$obj[[i]][,6])), label=pst("predict.evmBoot: covariates in output"))
    }

    par(mfrow=n2mfrow(nx))
    plot(pred, sameAxes=FALSE, type="median", main="Bootstrap median rl")
    plot(pred, sameAxes=FALSE, type="mean", main="Bootstrap mean rl")
  }
}
)
