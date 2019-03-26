context("wlm")

test_that("test error checking",{
  dat<-NA
  times<-1:30
  resp<-1
  pred<-c(2,3)
  norm<-"test"
  expect_error(wlm(dat,times,resp,pred,norm),
               "Error in wlm: inappropriate value of norm")
  norm<-"powind"
  expect_error(wlm(dat,times,resp,pred,norm),
               "Error in wlm: this value of norm not implemented yet")  
  norm<-"powall"
  expect_error(wlm(dat,times,resp,pred,norm),
               "Error in wlm: dat must be a list")
  dat<-list(v1=matrix(rnorm(100),10,10),v2=matrix(rnorm(100),10,10),v3=matrix(rnorm(100),10,10),
            v4=matrix(rnorm(100),10,10),v5=matrix(rnorm(100),10,10))
  resp<-6
  pred<-c(1,2)
  expect_error(wlm(dat,times,resp,pred,norm),
               "Error in wlm: resp and pred must be indices of dat")
  resp<-c(1,2)
  expect_error(wlm(dat,times,resp,pred,norm),
               "Error in wlm: you can only have one response")
  resp<-1
  pred<-c()
  expect_error(wlm(dat,times,resp,pred,norm),
               "Error in wlm: you must have at least one predictor")
  resp<-1
  pred<-1:3
  expect_error(wlm(dat,times,resp,pred,norm),
               "Error in wlm: resp cannot be in pred")
})

test_that("results in right format, and consistency",{
  set.seed(101)
  times<-1:30
  dat<-list(v1=matrix(rnorm(300),10,30),v2=matrix(rnorm(300),10,30),v3=matrix(rnorm(300),10,30),
            v4=matrix(rnorm(300),10,30),v5=matrix(rnorm(300),10,30))
  dat<-lapply(FUN=function(x){cleandat(x,times,1)$cdat},X=dat)
  resp<-2
  pred<-c(1,3,4)
  norm<-"powall"
  res<-wlm(dat,times,resp,pred,norm)
  
  #format
  expect_equal(class(res),c("wlm","list"))
  expect_equal(names(res),c("dat","times","norm","wtopt","wts","timescales",
                            "coefs","modval","coher"))
  expect_equal(dat[c(2,1,3,4)],res$dat)
  expect_equal(times,res$times)
  expect_equal(norm,res$norm)
  expect_equal(class(res$wts),"list")
  expect_equal(dim(res$wts[[1]]),c(10,30,length(res$timescales)))
  expect_equal(class(res$coefs),"data.frame")  
  expect_equal(dim(res$coefs),c(length(res$timescales),3))
  expect_equal(is.complex(res$coefs[1,1]),TRUE)
  expect_equal(names(res$coefs),c('v1','v3','v4'))
  expect_equal(is.complex(res$modval),TRUE)
  expect_equal(dim(res$modval),dim(res$wts[[1]]))
  expect_equal(length(res$coher),length(res$timescales))
  expect_equal(is.complex(res$coher),TRUE)
  
  expect_equal(Im(res$coher),rep(0,length(res$timescales)))
  expect_equal(all(Re(res$coher)>=0),TRUE)
  expect_equal(all(Re(res$coher)<=1),TRUE)

  #consistency
  expect_equal(sqrt(apply(X=res$modval*Conj(res$modval),FUN=mean,MARGIN=3,na.rm=T)),
               res$coher) 

  #do some tests with vector data
  dat<-list(v1=matrix(rnorm(30),1,30),v2=rnorm(30),v3=matrix(rnorm(30),1,30),
            v4=rnorm(30),v5=matrix(rnorm(30),1,30))
  dat<-lapply(FUN=function(x){cleandat(x,times,1)$cdat},X=dat)
  res<-wlm(dat,times,resp,pred,norm)
  
  expect_equal(class(res),c("wlm","list"))
  expect_equal(lapply(X=dat[c(2,1,3,4)],FUN=as.vector),res$dat)
  expect_equal(names(res),c("dat","times","norm","wtopt","wts","timescales",
                            "coefs","modval","coher"))
  expect_equal(times,res$times)
  expect_equal(norm,res$norm)
  expect_equal(class(res$wts),"list")
  expect_equal(dim(res$wts[[1]]),c(1,30,length(res$timescales)))
  expect_equal(dim(res$wts[[2]]),c(1,30,length(res$timescales)))
  expect_equal(dim(res$wts[[3]]),c(1,30,length(res$timescales)))
  expect_equal(class(res$coefs),"data.frame")  
  expect_equal(dim(res$coefs),c(length(res$timescales),3))
  expect_equal(is.complex(res$coefs[1,1]),TRUE)
  expect_equal(names(res$coefs),c('v1','v3','v4'))
  expect_equal(is.complex(res$modval),TRUE)
  expect_equal(dim(res$modval),dim(res$wts[[1]]))
  expect_equal(length(res$coher),length(res$timescales))
  expect_equal(is.complex(res$coher),TRUE)
  
  expect_equal(Im(res$coher),rep(0,length(res$timescales)))
  expect_equal(all(Re(res$coher)>=0),TRUE)
  expect_equal(all(Re(res$coher)<=1),TRUE)

  #consistency
  expect_equal(sqrt(apply(X=res$modval*Conj(res$modval),FUN=mean,MARGIN=3,na.rm=T)),
               res$coher)
})

test_that("test for correct format and actual values, one-predictor case",{
  set.seed(101)
  times<-1:30
  dat<-list(v1=matrix(rnorm(300),10,30),v2=matrix(rnorm(300),10,30))
  dat<-lapply(FUN=function(x){cleandat(x,times,1)$cdat},X=dat)
  resp<-1
  pred<-2
  norm<-"powall"
  res<-wlm(dat,times,resp,pred,norm)

  #check for format
  expect_equal(class(res),c("wlm","list"))
  expect_equal(names(res),c("dat","times","norm","wtopt","wts","timescales",
                            "coefs","modval","coher"))
  expect_equal(dat,res$dat)
  expect_equal(times,res$times)
  expect_equal(norm,res$norm)
  expect_equal(class(res$wts),"list")
  expect_equal(dim(res$wts[[1]]),c(10,30,length(res$timescales)))
  expect_equal(class(res$coefs),"data.frame")  
  expect_equal(dim(res$coefs),c(length(res$timescales),1))
  expect_equal(is.complex(res$coefs[1,1]),TRUE)
  expect_equal(names(res$coefs),c('v2'))
  expect_equal(is.complex(res$modval),TRUE)
  expect_equal(dim(res$modval),dim(res$wts[[1]]))
  expect_equal(length(res$coher),length(res$timescales))
  expect_equal(is.complex(res$coher),TRUE)
  
  expect_equal(Im(res$coher),rep(0,length(res$timescales)))
  expect_equal(all(Re(res$coher)>=0),TRUE)
  expect_equal(all(Re(res$coher)<=1),TRUE)
  
  #consistency
  expect_equal(sqrt(apply(X=res$modval*Conj(res$modval),FUN=mean,MARGIN=3,na.rm=T)),
               res$coher)
  expect_equal(apply(X=res$wts[[1]]*Conj(res$wts[[2]]),FUN=mean,MARGIN=3,na.rm=T),res$coefs[[1]])
  
  #now check for correct values by comparing to coherence
  cohres<-coh(dat[[1]],dat[[2]],times,norm) 
  expect_equal(res$coher,cohres$coher*Conj(res$coefs[[1]])/Mod(res$coefs[[1]]))
})

test_that("now do a two-predictor case",{
  #Test by comparing coefs to the matrix multiplication way of defining the
  #coefs, spelled out in the plankton sup mat, and comparing to the qr.solve 
  #way implemented in wlm

  set.seed(101)
  times<-1:30
  dat<-list(v1=matrix(rnorm(300),10,30),v2=matrix(rnorm(300),10,30),
            v3=matrix(rnorm(300),10,30))
  dat<-lapply(FUN=function(x){cleandat(x,times,1)$cdat},X=dat)
  resp<-1
  pred<-2:3
  norm<-"powall"
  res<-wlm(dat,times,resp,pred,norm)
  
  #check for format
  expect_equal(class(res),c("wlm","list"))
  expect_equal(names(res),c("dat","times","norm","wtopt","wts","timescales",
                            "coefs","modval","coher"))
  expect_equal(dat,res$dat)
  expect_equal(times,res$times)
  expect_equal(norm,res$norm)
  expect_equal(class(res$wts),"list")
  expect_equal(dim(res$wts[[1]]),c(10,30,length(res$timescales)))
  expect_equal(class(res$coefs),"data.frame")  
  expect_equal(dim(res$coefs),c(length(res$timescales),2))
  expect_equal(is.complex(res$coefs[1,1]),TRUE)
  expect_equal(names(res$coefs),c('v2','v3'))
  expect_equal(is.complex(res$modval),TRUE)
  expect_equal(dim(res$modval),dim(res$wts[[1]]))
  expect_equal(length(res$coher),length(res$timescales))
  expect_equal(is.complex(res$coher),TRUE)
  
  expect_equal(Im(res$coher),rep(0,length(res$timescales)))
  expect_equal(all(Re(res$coher)>=0),TRUE)
  expect_equal(all(Re(res$coher)<=1),TRUE)
  
  #consistency
  expect_equal(sqrt(apply(X=res$modval*Conj(res$modval),FUN=mean,MARGIN=3,na.rm=T)),
               res$coher)

  #now check for correct values by comparing to the way of computing 
  #the coefficients that is outlined at the end of section S7 of the sup 
  #mat of the plankton paper
  M<-array(NA,c(2,2,length(res$timescales)))
  M[1,1,]<-apply(X=res$wts[[2]]*Conj(res$wts[[2]]),FUN=mean,MARGIN=3,na.rm=T)
  M[2,2,]<-apply(X=res$wts[[3]]*Conj(res$wts[[3]]),FUN=mean,MARGIN=3,na.rm=T)
  M[1,2,]<-apply(X=res$wts[[3]]*Conj(res$wts[[2]]),FUN=mean,MARGIN=3,na.rm=T)
  M[2,1,]<-apply(X=res$wts[[2]]*Conj(res$wts[[3]]),FUN=mean,MARGIN=3,na.rm=T)
  p<-matrix(NA,2,length(res$timescales))
  p[1,]<-apply(X=res$wts[[1]]*Conj(res$wts[[2]]),FUN=mean,MARGIN=3,na.rm=T)
  p[2,]<-apply(X=res$wts[[1]]*Conj(res$wts[[3]]),FUN=mean,MARGIN=3,na.rm=T)
  expect_equal(as.complex(M[,,1]%*%as.complex(res$coefs[1,])),p[,1])
  expect_equal(as.complex(M[,,2]%*%as.complex(res$coefs[2,])),p[,2])
  expect_equal(as.complex(M[,,3]%*%as.complex(res$coefs[3,])),p[,3])
  expect_equal(as.complex(M[,,4]%*%as.complex(res$coefs[4,])),p[,4])
  expect_equal(as.complex(M[,,5]%*%as.complex(res$coefs[5,])),p[,5])
})