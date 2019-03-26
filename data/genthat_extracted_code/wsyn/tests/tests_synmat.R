context("synmat")

test_that("test of error catching",{
  dat<-matrix(rnorm(300),10,30)
  times<-1:30
  dat<-cleandat(dat,times,2)$cdat
  expect_error(synmat(dat,times,"coh",weighted=FALSE),
               "Error in synmat: unweighted networks available only if method involves a significance test")
  expect_error(synmat(dat,times,"test"),"Error in synmat: bad value of method")
})

test_that("test pearson methods",{
  #pearson
  dat<-matrix(rnorm(300),10,30)
  times<-1:30
  dat<-cleandat(dat,times,2)$cdat
  res<-synmat(dat,times,"pearson")
  expect_equal(diag(res),rep(NA*numeric(1),10))
  expect_equal(res[1,2],cor(dat[1,],dat[2,]))
  
  #pearson.sig.std
  res<-synmat(dat,times,"pearson.sig.std")
  expect_equal(diag(res),rep(NA*numeric(1),10))
  expect_equal(res[2,3],1-cor.test(dat[2,],dat[3,],method="pearson",alternative="greater")$p.value)
  expect_equal(res[3,2],1-cor.test(dat[2,],dat[3,],method="pearson",alternative="greater")$p.value)
  
  #pearson.sig.fft
  set.seed(101)
  sig<-matrix(.9,5,5)
  diag(sig)<-1
  dat1<-t(mvtnorm::rmvnorm(30,mean=rep(0,5),sigma=sig))
  dat2<-t(mvtnorm::rmvnorm(30,mean=rep(0,5),sigma=sig))
  dat<-rbind(dat1,dat2)
  times<-1:30
  dat<-cleandat(dat,times,clev=2)$cdat
  method<-"pearson.sig.fft"
  res<-synmat(dat,times,method,nsurrogs=100)
  expect_equal(diag(res),rep(NA*numeric(1),10))
  diag(res)<-1
  expect_true(all(res[1:5,1:5]>.95))
  expect_true(all(res[6:10,6:10]>.95))
  expect_true(all(res[1:5,6:10]<.95))
  expect_true(all(res[6:10,1:5]<.95))
  
  set.seed(101)
  sig<-matrix(.9,5,5)
  diag(sig)<-1
  dat1<-t(mvtnorm::rmvnorm(30,mean=rep(0,5),sigma=sig))
  dat2<-t(mvtnorm::rmvnorm(30,mean=rep(0,5),sigma=sig))
  dat<-rbind(dat1,dat2)
  times<-1:30
  dat<-cleandat(dat,times,clev=2)$cdat
  method<-"pearson.sig.fft"
  res<-synmat(dat,times,method,nsurrogs=100,weighted=FALSE,
              sigthresh=0.95)
  eres<-matrix(1,10,10)
  eres[1:5,6:10]<-0
  eres[6:10,1:5]<-0
  diag(eres)<-NA
  expect_equal(res,eres)
  
  #pearson.sig.aaft
  method<-"pearson.sig.aaft"
  res<-synmat(dat,times,method,nsurrogs=100)
  expect_equal(diag(res),rep(NA*numeric(1),10))
  diag(res)<-1
  expect_true(all(res[1:5,1:5]>.95))
  expect_true(all(res[6:10,6:10]>.95))
  expect_true(all(res[1:5,6:10]<.95))
  expect_true(all(res[6:10,1:5]<.95))
})

test_that("test kendall methods",{
  #kendall
  dat<-matrix(rnorm(300),10,30)
  times<-1:30
  dat<-cleandat(dat,times,2)$cdat
  res<-synmat(dat,times,"kendall")
  expect_equal(diag(res),rep(NA*numeric(1),10))
  expect_equal(res[1,2],cor(dat[1,],dat[2,],method="kendall"))
  
  #kendall.sig.std
  res<-synmat(dat,times,"kendall.sig.std")
  expect_equal(diag(res),rep(NA*numeric(1),10))
  expect_equal(res[2,3],1-cor.test(dat[2,],dat[3,],method="kendall",alternative="greater")$p.value)
  expect_equal(res[3,2],1-cor.test(dat[2,],dat[3,],method="kendall",alternative="greater")$p.value)
  
  #kendall.sig.fft, kendall.sig.aaft
  #no need, same code as the pearson
})

test_that("test spearman methods",{
  #spearman
  dat<-matrix(rnorm(300),10,30)
  times<-1:30
  dat<-cleandat(dat,times,2)$cdat
  res<-synmat(dat,times,"spearman")
  expect_equal(diag(res),rep(NA*numeric(1),10))
  expect_equal(res[1,2],cor(dat[1,],dat[2,],method="spearman"))
  
  #spearman.sig.std
  res<-synmat(dat,times,"spearman.sig.std")
  expect_equal(diag(res),rep(NA*numeric(1),10))
  expect_equal(res[2,3],1-cor.test(dat[2,],dat[3,],method="spearman",alternative="greater")$p.value)
  expect_equal(res[3,2],1-cor.test(dat[2,],dat[3,],method="spearman",alternative="greater")$p.value)
  
  #spearman.sig.fft, spearman.sig.aaft
  #no need, same code as the pearson
})

test_that("test coh-based methods",{
  #coh
  dat<-matrix(rnorm(300),10,30)
  times<-1:30
  dat<-cleandat(dat,times,2)$cdat
  res<-synmat(dat,times,"coh")
  expect_equal(diag(res),rep(NA*numeric(1),10))
  cohres<-coh(dat[1,],dat[2,],times,norm="powind",sigmethod="none",
              scale.min=2,scale.max.input=NULL,f0=1,sigma=1.05)
  expect_equal(res[1,2],mean(Mod(cohres$coher)))
  cohres<-coh(dat[2,],dat[3,],times,norm="powind",sigmethod="none",
              scale.min=2,scale.max.input=NULL,f0=1,sigma=1.05)
  expect_equal(res[3,2],mean(Mod(cohres$coher)))
  
  #coh.sig.fft
  if (exists(x="RUN_INTENSIVE_TESTS",envir=globalenv()) && 
      identical(globalenv()$RUN_INTENSIVE_TESTS,TRUE))
  {
    set.seed(101)
    sig<-matrix(.95,5,5)
    diag(sig)<-1
    dat1<-t(mvtnorm::rmvnorm(30,mean=rep(0,5),sigma=sig))
    dat2<-t(mvtnorm::rmvnorm(30,mean=rep(0,5),sigma=sig))
    dat<-rbind(dat1,dat2)
    times<-1:30
    dat<-cleandat(dat,times,clev=2)$cdat
    method<-"coh.sig.fft"
    res<-synmat(dat,times,method,tsrange=c(3,15),nsurrogs=100)
    expect_equal(dim(res),c(10,10))
    expect_equal(diag(res),rep(NA*numeric(1),10))
    diag(res)<-1
    expect_true(all(res[1:5,1:5]>.95))
    expect_true(all(res[6:10,6:10]>.95))
    expect_true(all(res[1:5,6:10]<.95))
    expect_true(all(res[6:10,1:5]<.95))
  }
  
  #coh.sig.aaft
  if (exists(x="RUN_INTENSIVE_TESTS",envir=globalenv()) && 
      identical(globalenv()$RUN_INTENSIVE_TESTS,TRUE))
  {
    set.seed(201)
    sig<-matrix(.95,5,5)
    diag(sig)<-1
    dat1<-t(mvtnorm::rmvnorm(30,mean=rep(0,5),sigma=sig))
    dat2<-t(mvtnorm::rmvnorm(30,mean=rep(0,5),sigma=sig))
    dat<-rbind(dat1,dat2)
    times<-1:30
    dat<-cleandat(dat,times,clev=2)$cdat
    method<-"coh.sig.aaft"
    res<-synmat(dat,times,method,tsrange=c(3,15),nsurrogs=100)
    expect_equal(dim(res),c(10,10))
    expect_equal(diag(res),rep(NA*numeric(1),10))
    diag(res)<-1
    expect_true(all(res[1:5,1:5]>.95))
    expect_true(all(res[6:10,6:10]>.95))
    expect_true(all(res[1:5,6:10]<.95))
    expect_true(all(res[6:10,1:5]<.95))
  }
  
  #coh.sig.fast
  set.seed(301) 
  sig<-matrix(.95,5,5)
  diag(sig)<-1
  dat1<-t(mvtnorm::rmvnorm(30,mean=rep(0,5),sigma=sig))
  dat2<-t(mvtnorm::rmvnorm(30,mean=rep(0,5),sigma=sig))
  dat<-rbind(dat1,dat2)
  times<-1:30
  dat<-cleandat(dat,times,clev=2)$cdat
  method<-"coh.sig.fast"
  res<-synmat(dat,times,method,tsrange=c(3,15),nsurrogs=100)
  expect_equal(dim(res),c(10,10))
  expect_equal(diag(res),rep(NA*numeric(1),10))
  diag(res)<-1
  expect_true(all(res[1:5,1:5]>.95))
  expect_true(all(res[6:10,6:10]>.95))
  expect_true(all(res[1:5,6:10]<.95))
  expect_true(all(res[6:10,1:5]<.95))
})
  
test_that("test ReXWT-based methods",{
  #ReXWT
  dat<-matrix(rnorm(300),10,30)
  times<-1:30
  dat<-cleandat(dat,times,2)$cdat
  res<-synmat(dat,times,"ReXWT")
  expect_equal(diag(res),rep(NA*numeric(1),10))
  cohres<-coh(dat[1,],dat[2,],times,norm="powind",sigmethod="none",
              scale.min=2,scale.max.input=NULL,f0=1,sigma=1.05)
  expect_equal(res[1,2],mean(Re(cohres$coher)))
  cohres<-coh(dat[2,],dat[3,],times,norm="powind",sigmethod="none",
              scale.min=2,scale.max.input=NULL,f0=1,sigma=1.05)
  expect_equal(res[3,2],mean(Re(cohres$coher)))
  
  #ReXWT.sig.fft
  if (exists(x="RUN_INTENSIVE_TESTS",envir=globalenv()) && 
      identical(globalenv()$RUN_INTENSIVE_TESTS,TRUE))
  {
    set.seed(101)
    sig<-matrix(.95,5,5)
    diag(sig)<-1
    dat1<-t(mvtnorm::rmvnorm(30,mean=rep(0,5),sigma=sig))
    dat2<-t(mvtnorm::rmvnorm(30,mean=rep(0,5),sigma=sig))
    dat<-rbind(dat1,dat2)
    times<-1:30
    dat<-cleandat(dat,times,clev=2)$cdat
    method<-"ReXWT.sig.fft"
    res<-synmat(dat,times,method,tsrange=c(3,15),nsurrogs=100)
    expect_equal(dim(res),c(10,10))
    expect_equal(diag(res),rep(NA*numeric(1),10))
    diag(res)<-1
    expect_true(all(res[1:5,1:5]>.95))
    expect_true(all(res[6:10,6:10]>.95))
    expect_true(all(res[1:5,6:10]<.95))
    expect_true(all(res[6:10,1:5]<.95))  
  }
  
  #ReXWT.sig.aaft
  if (exists(x="RUN_INTENSIVE_TESTS",envir=globalenv()) && 
      identical(globalenv()$RUN_INTENSIVE_TESTS,TRUE))
  {
    set.seed(101)
    sig<-matrix(.95,5,5)
    diag(sig)<-1
    dat1<-t(mvtnorm::rmvnorm(30,mean=rep(0,5),sigma=sig))
    dat2<-t(mvtnorm::rmvnorm(30,mean=rep(0,5),sigma=sig))
    dat<-rbind(dat1,dat2)
    times<-1:30
    dat<-cleandat(dat,times,clev=2)$cdat
    method<-"ReXWT.sig.aaft"
    res<-synmat(dat,times,method,tsrange=c(3,15),nsurrogs=100)
    expect_equal(dim(res),c(10,10))
    expect_equal(diag(res),rep(NA*numeric(1),10))
    diag(res)<-1
    expect_true(all(res[1:5,1:5]>.95))
    expect_true(all(res[6:10,6:10]>.95))
    expect_true(all(res[1:5,6:10]<.95))
    expect_true(all(res[6:10,1:5]<.95))
  }
  
  #ReXWT.sig.fast
  set.seed(101)
  sig<-matrix(.95,5,5)
  diag(sig)<-1
  dat1<-t(mvtnorm::rmvnorm(30,mean=rep(0,5),sigma=sig))
  dat2<-t(mvtnorm::rmvnorm(30,mean=rep(0,5),sigma=sig))
  dat<-rbind(dat1,dat2)
  times<-1:30
  dat<-cleandat(dat,times,clev=2)$cdat
  method<-"ReXWT.sig.fast"
  res<-synmat(dat,times,method,tsrange=c(3,15),nsurrogs=100)
  expect_equal(dim(res),c(10,10))
  expect_equal(diag(res),rep(NA*numeric(1),10))
  diag(res)<-1
  expect_true(all(res[1:5,1:5]>.95))
  expect_true(all(res[6:10,6:10]>.95))
  expect_true(all(res[1:5,6:10]<.95))
  expect_true(all(res[6:10,1:5]<.95))
})

test_that("phase coherence and average phase methods",{
  #phasecoh
  dat<-matrix(rnorm(300),10,30)
  times<-1:30
  dat<-cleandat(dat,times,2)$cdat
  res<-synmat(dat,times,"phasecoh")
  expect_equal(diag(res),rep(NA*numeric(1),10))
  cohres<-coh(dat[1,],dat[2,],times,norm="phase",sigmethod="none",
              scale.min=2,scale.max.input=NULL,f0=1,sigma=1.05)
  expect_equal(res[1,2],mean(Mod(cohres$coher)))
  cohres<-coh(dat[2,],dat[3,],times,norm="phase",sigmethod="none",
              scale.min=2,scale.max.input=NULL,f0=1,sigma=1.05)
  expect_equal(res[3,2],mean(Mod(cohres$coher)))

  #phasecoh.sig.fft
  if (exists(x="RUN_INTENSIVE_TESTS",envir=globalenv()) && 
      identical(globalenv()$RUN_INTENSIVE_TESTS,TRUE))
  {
    set.seed(301)
    sig<-matrix(.95,5,5)
    diag(sig)<-1
    dat1<-t(mvtnorm::rmvnorm(30,mean=rep(0,5),sigma=sig))
    dat2<-t(mvtnorm::rmvnorm(30,mean=rep(0,5),sigma=sig))
    dat<-rbind(dat1,dat2)
    times<-1:30
    dat<-cleandat(dat,times,clev=2)$cdat
    method<-"phasecoh.sig.fft"
    res<-synmat(dat,times,method,tsrange=c(3,15),nsurrogs=100)
    expect_equal(dim(res),c(10,10))
    expect_equal(diag(res),rep(NA*numeric(1),10))
    diag(res)<-1
    expect_true(all(res[1:5,1:5]>.95))
    expect_true(all(res[6:10,6:10]>.95))
    expect_true(all(res[1:5,6:10]<.95))
    expect_true(all(res[6:10,1:5]<.95))
  }
  
  #phasecoh.sig.aaft
  if (exists(x="RUN_INTENSIVE_TESTS",envir=globalenv()) && 
      identical(globalenv()$RUN_INTENSIVE_TESTS,TRUE))
  {
    set.seed(301)
    sig<-matrix(.95,5,5)
    diag(sig)<-1
    dat1<-t(mvtnorm::rmvnorm(30,mean=rep(0,5),sigma=sig))
    dat2<-t(mvtnorm::rmvnorm(30,mean=rep(0,5),sigma=sig))
    dat<-rbind(dat1,dat2)
    times<-1:30
    dat<-cleandat(dat,times,clev=2)$cdat
    method<-"phasecoh.sig.aaft"
    res<-synmat(dat,times,method,tsrange=c(3,15),nsurrogs=100)
    expect_equal(dim(res),c(10,10))
    expect_equal(diag(res),rep(NA*numeric(1),10))
    diag(res)<-1
    expect_true(all(res[1:5,1:5]>.95))
    expect_true(all(res[6:10,6:10]>.95))
    expect_true(all(res[1:5,6:10]<.95))
    expect_true(all(res[6:10,1:5]<.95))
  }
})
