

# data simulation
set.seed(1)
list <- cornet:::.simulate(n=100,p=200)
y <- list$y; X <- list$X

# penalised regression
cutoff <- 1
foldid <- palasso:::.folds(y=y>cutoff,nfolds=10)
fit <- cornet::cornet(y=y,cutoff=cutoff,X=X,foldid=foldid)
net <- list()
net$gaussian <- glmnet::cv.glmnet(y=y,x=X,family="gaussian",foldid=foldid)
net$binomial <- glmnet::cv.glmnet(y=y>cutoff,x=X,family="binomial",foldid=foldid)

#--- cornet equals glmnet ---

for(dist in c("gaussian","binomial")){
  
  testthat::test_that("cross-validated loss",{
    a <- fit[[dist]]$sigma.cvm
    b <- net[[dist]]$cvm
    diff <- abs(a[seq_along(b)]-b)
    testthat::expect_true(all(diff<1e-06))
  })
  
  testthat::test_that("optimal lambda",{
    a <- fit[[dist]]$lambda.min
    b <- net[[dist]]$lambda.min
    testthat::expect_true(a==b)
  })
  
  testthat::test_that("lambda sequence",{
    a <- fit[[dist]]$lambda
    b <- net[[dist]]$lambda
    testthat::expect_true(all(a[seq_along(b)]==b))
  })
  
  testthat::test_that("predicted values",{
    a <- stats::predict(object=fit[[dist]],newx=X)
    b <- stats::predict(object=net[[dist]]$glmnet.fit,newx=X)
    testthat::expect_true(all(a==b))
  })
  
  testthat::test_that("coefficients",{
    a <- fit[[dist]]$beta
    b <- net[[dist]]$glmnet.fit$beta
    testthat::expect_true(all(a==b))
  })
  
}

#--- other checks ---

testthat::test_that("predicted probabilities",{ # important!
  a <- cornet:::predict.cornet(object=fit,newx=X)$binomial
  b <- as.numeric(stats::predict(object=net$binomial,newx=X,s="lambda.min",type="response"))
  testthat::expect_true(all(a==b))
})

testthat::test_that("estimated coefficients",{ # important!
  a <- cornet:::coef.cornet(fit)
  b <- as.numeric(stats::coef(object=net$gaussian,s="lambda.min"))
  c <- as.numeric(stats::coef(object=net$binomial,s="lambda.min"))
  cond <- all(a[,"beta"]==b) & all(a[,"gamma"]==c)
  testthat::expect_true(cond)
})

testthat::test_that("tuning parameters",{
  a <- (0 <= fit$sigma.min) & is.finite(fit$sigma.min)
  b <- (0 <= fit$pi.min) & (fit$pi.min <= 1)
  c <- min(fit$cvm) == fit$cvm[names(fit$sigma.min),names(fit$pi.min)]
  testthat::expect_true(all(a,b,c))
})

testthat::test_that("print function",{
  a <- cornet:::print.cornet(fit)
  testthat::expect_true(is.null(a))
})

testthat::test_that("plot function",{
  a <- cornet:::plot.cornet(fit)
  testthat::expect_true(is.null(a))
})

testthat::test_that("hidden compare function",{
  res <- cornet:::.compare(y=y,cutoff=cutoff,X=X,nfolds=2)
  cornet:::.check(x=res$resid.pvalue,min=0,max=1,type="vector")
})

testthat::test_that("hidden test function",{
  p <- cornet:::.test(y=y,cutoff=cutoff,X=X)
  cornet:::.check(x=p,min=0,max=1,type="scalar")
})
