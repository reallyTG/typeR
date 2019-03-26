context("cleandat")

test_that("test error catching not covered elsewhere",{
  times<-1:100
  dat<-rnorm(100)
  expect_error(cleandat(dat,times,clev=6),"Error in cleandat: clev must be 1, 2, 3, 4, or 5")
  
  expect_error(cleandat("test",times,clev=4),"Error in cleandat: dat must be numeric")
  
  dat<-rnorm(99)
  expect_error(cleandat(dat,times,clev=1),"Error in cleandat: length of dat and times must be equal")
  
  dat<-c(dat,NA)
  expect_error(cleandat(dat,times,clev=1),"Error in cleandat: dat must not contain NAs, NaNs, Infs")
  
  dat<-2*times+1
  dat<-dat-mean(dat)
  expect_error(cleandat(dat,times,clev=3),"Error in cleandat: cannot perform clev 3 or greater cleaning on time series that are constant or a perfect linear trend")

  times<-1:100
  dat<-rnorm(100)
  clev<-4
  mints<-(-1)
  expect_error(cleandat(dat=dat,times=times,clev=clev,mints=mints),
               "Error in cleandat: if clev is 4 or 5, mints must be NA, NaN, or a positive number")
  
  expect_error(cleandat(dat=dat,times=times,clev=clev,mints=Inf),
               "Error in cleandat: if clev is 4 or 5, mints must be NA, NaN, or a positive number")
})

test_that("clev is 1",{
  times<-1:100
  dat<-rnorm(100)
  clev<-1
  res<-cleandat(dat,times,clev)
  expect_equal(as.vector(res$cdat),dat-mean(dat))
  expect_equal(res$clev,1)
  expect_equal(is.na(res$optlambdas),TRUE)
})

test_that("clev is 2",{
  times<-1:100
  dat<-matrix(rnorm(200),2,100)
  clev<-2
  res<-cleandat(dat,times,clev)
  y<-dat[1,]
  altres<-unname(residuals(lm(y~times)))
  expect_equal(unname(res$cdat[1,]),altres)
})

test_that("clev is 3",{
  times<-1:100
  dat<-matrix(rnorm(200),2,100)
  clev<-3
  res<-cleandat(dat,times,clev)
  y<-dat[1,]
  altres<-unname(residuals(lm(y~times)))
  altres<-altres/sd(altres)
  expect_equal(unname(res$cdat[1,]),altres)
})

test_that("clev is 4",{
  set.seed(101)
  times<-seq(1,100,1)
  dat<-rnorm(100)
  clev<-4
  res<-cleandat(dat,times,clev)

  #test format
  expect_type(res,"list")
  expect_equal(names(res),c("cdat","clev","optlambdas"))
  expect_type(res$optlambdas,"double")
  expect_equal(length(res$optlambdas),1)
  expect_equal(res$clev,4)
  expect_type(res$cdat,"double")
  expect_equal(length(res$cdat),length(times))
  expect_equal(mean(res$cdat),0)
  expect_equal(unname(coef(lm(res$cdat~times))),c(0,0))

  set.seed(101)
  times<-seq(1,100,1)
  dat1<-.1*times+rnorm(length(times),mean=0,sd=.025*times+.5)+1
  dat2<-.1*times+rnorm(length(times),mean=0,sd=.025*times+.5)+1
  dat<-rbind(dat1,dat2)
  res<-cleandat(dat,times,clev,lambdas=seq(-2,2,.01),mints=NaN)
  
  #test format
  expect_type(res,"list")
  expect_equal(names(res),c("cdat","clev","optlambdas"))
  expect_type(res$optlambdas,"double")
  expect_equal(length(res$optlambdas),1)
  expect_equal(res$clev,4)
  expect_type(res$cdat,"double")
  expect_equal(dim(res$cdat)[2],length(times))
  expect_equal(mean(res$cdat[1,]),0)
  expect_equal(mean(res$cdat[2,]),0)
  expect_equal(unname(coef(lm(res$cdat[1,]~times))),c(0,0))
  expect_equal(unname(coef(lm(res$cdat[2,]~times))),c(0,0))

  #***test directly against formulas of Box Cox paper

  if (exists(x="RUN_INTENSIVE_TESTS",envir=globalenv()) && 
      identical(globalenv()$RUN_INTENSIVE_TESTS,TRUE))
  {
    #the data
    set.seed(101)
    times<-seq(1,100,1)
    dat1<-.1*times+rnorm(length(times),mean=0,sd=.025*times+.5)+1
    dat2<-.1*times+rnorm(length(times),mean=0,sd=.025*times+.5)+1
    dat<-rbind(dat1,dat2)
    
    #use cleandat
    lambdas<-seq(-2,2,by=0.001)
    cd<-cleandat(dat,times,clev=4,lambdas=lambdas,mints=NaN)
    
    #use formulas of Box & Cox, 1964, specifically equations 8 and 9
    #Box, GEP and Cox, DR (1964) An analysis of transformations (with discussion). Journal of the Royal Statistical Society B, 26, 211–252.
    bcproflik<-function(dat,times,lambda)
    {
      tdat<-bctrans(dat,lambda)
      thistd<-tdat[1,]
      sse1<-sum((residuals(lm(thistd~times)))^2)
      n<-length(dat[1,])
      ll1<-(-0.5*n*log(sse1/n)+(lambda-1)*sum(log(dat[1,])))
      thistd<-tdat[2,]
      sse2<-sum((residuals(lm(thistd~times)))^2)
      ll2<-(-0.5*n*log(sse2/n)+(lambda-1)*sum(log(dat[2,])))
      
      return(ll1+ll2)
    }
    pl<-NA*numeric(length(lambdas))
    for (counter in 1:length(lambdas))
    {
      pl[counter]<-bcproflik(dat,times,lambdas[counter])
    }
    optlambda2<-lambdas[pl==max(pl)]
    
    expect_equal(optlambda2,cd$optlambda)
    #we continue to rely on boxcox instead of some version of the above because boxcox is much faster
  }
})

test_that("clev is 5",{
  set.seed(101)
  times<-seq(1,100,1)
  dat<-.1*times+rnorm(length(times),mean=0,sd=.025*times+.5)+1
  #plot(times,dat)
  #hist(residuals(lm(dat~times)))
  clev<-5
  res<-cleandat(dat,times,clev,lambdas=seq(-2,2,.01),mints=NaN)
  
  #test format
  expect_type(res,"list")
  expect_equal(names(res),c("cdat","clev","optlambdas"))
  expect_type(res$optlambdas,"double")
  expect_equal(length(res$optlambdas),1)
  expect_equal(res$clev,5)
  expect_type(res$cdat,"double")
  expect_equal(length(res$cdat),length(times))
  expect_equal(mean(res$cdat),0)
  expect_equal(unname(coef(lm(res$cdat~times))),c(0,0))
  
  #see if the output is the same as a direct call to boxcox
  altres<-MASS::boxcox(dat~times,interp=FALSE,lambda=seq(-2,2,.01),plotit=FALSE)
  altoptlambda<-altres$x[altres$y==max(altres$y)]
  expect_equal(res$optlambdas,altoptlambda)
  altcdat<-bctrans(dat,altoptlambda)
  altcdat<-residuals(lm(altcdat~times))
  altcdat<-altcdat/sd(altcdat)
  expect_equal(unname(altcdat),res$cdat)

  #***test directly against formulas of Box Cox paper
  
  if (exists(x="RUN_INTENSIVE_TESTS",envir=globalenv()) && 
      identical(globalenv()$RUN_INTENSIVE_TESTS,TRUE))
  {
    #the data
    set.seed(301)
    times<-seq(1,200,1)
    dat<-.1*times+2+exp(rnorm(length(times),mean=0,sd=.5))
    
    #use cleandat
    lambdas<-seq(-2,2,by=0.001)
    cd<-cleandat(dat,times,clev=5,lambdas=lambdas,mints=NaN)
    
    #use formulas of Box & Cox, 1964, specifically equations 8 and 9
    #Box, GEP and Cox, DR (1964) An analysis of transformations (with discussion). Journal of the Royal Statistical Society B, 26, 211–252.
    bcproflik<-function(dat,times,lambda)
    {
      tdat<-bctrans(dat,lambda)
      sse<-sum((residuals(lm(tdat~times)))^2)
      n<-length(dat)
      return(-0.5*n*log(sse/n)+(lambda-1)*sum(log(dat)))
    }
    pl<-NA*numeric(length(lambdas))
    for (counter in 1:length(lambdas))
    {
      pl[counter]<-bcproflik(dat,times,lambdas[counter])
    }
    optlambda2<-lambdas[pl==max(pl)]
    
    expect_equal(optlambda2,cd$optlambda)
    #we continue to rely on boxcox instead of some version of the above because boxcox is much faster
  }
})