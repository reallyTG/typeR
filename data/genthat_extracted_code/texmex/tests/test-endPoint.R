context("endPoint")

test_that("endPoint behaves as it should", {
  skip_on_cran()
  skip_on_travis()
    
  for(Family in list(gpd,gev)){
    pst <- function(msg) texmexPst(msg,Family=Family)
    set.seed(20130617)
    
    for(i in 1:5){
      th <- switch(Family$name,GPD=0.3,GEV=-Inf)
      fit <- evm(rnorm(100),th=th,family=Family)
      co <- coef(fit)
      ep.current <- endPoint(fit,verbose=FALSE,.unique=TRUE)
      ep.target <- switch(Family$name,GPD=ifelse(co[2] < 0, th-exp(co[1])/co[2],Inf),
                          GEV=ifelse(co[3] < 0, co[1]-exp(co[2])/co[3],Inf))
      expect_that(ep.current, is_equivalent_to(ep.target), label=pst("endPoint:checkcalcforevmOptnocovariates"))

      fit <- evm(rnorm(100),th=th,family=Family,method="simulate",trace=50000)
      co <- coef(fit$map)
      ep.current <- endPoint(fit,verbose=FALSE,.unique=TRUE)
      ep.target <- switch(Family$name,GPD=ifelse(co[2] < 0, th-exp(co[1])/co[2],Inf), 
                          GEV=ifelse(co[3] < 0, co[1]-exp(co[2])/co[3],Inf))
      expect_that(ep.current, is_equivalent_to(ep.target), label=pst("endPoint:checkcalcforevmSimnocovariates"))
    }  
    
    # test with covariates
    
    n <- 50
    mu <- 1
    for(i in 1:5){
      X <- data.frame(a = rnorm(n),b = runif(n,-0.1,0.1))
      param <- switch(Family$name,GPD=X,GEV=cbind(mu,X))
      th <- switch(Family$name,GPD=0,GEV=-Inf)
      X$Y <- Family$rng(n,param,list(threshold=th))
      fit <- evm(Y,data=X,phi=~a,xi=~b,th=th,family=Family)
      lp <- linearPredictors(fit)$link
      ep.current <- endPoint(fit,verbose=FALSE,.unique=FALSE)
      ep.target <- switch(Family$name,GPD=ifelse(lp[,2] < 0, th-exp(lp[,1])/lp[,2],Inf),
                          GEV=ifelse(lp[,3] < 0, lp[,1]-exp(lp[,2])/lp[,3],Inf))
      expect_that(ep.current, is_equivalent_to(ep.target), label=pst("endPoint:checkcalcforevmSimwithcovariates"))
    }
  }
}
)
