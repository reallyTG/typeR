context("clust_methods")

#tests of set and get functions considered unnecessary

test_that("test print.clust",{
  set.seed(101)
  sig<-matrix(.8,5,5)
  diag(sig)<-1
  lents<-50
  dat1<-t(mvtnorm::rmvnorm(lents,mean=rep(0,5),sigma=sig))
  dat2<-t(mvtnorm::rmvnorm(lents,mean=rep(0,5),sigma=sig))
  dat<-rbind(dat1,dat2)
  times<-1:lents
  dat<-cleandat(dat,times,clev=1)$cdat
  coords<-data.frame(Y=rep(0,10),X=1:10)
  method<-"coh.sig.fast"

  res<-clust(dat,times,coords,method,nsurrogs = 100)
  mod1val<-round(res$modres[[1]]$totQ,4)
  mod2val<-round(res$modres[[2]]$totQ,4)
  expect_equal(capture_output(print(res)),paste0("clust object:\ntimes, a length 50 numeric vector:\n1 2 3 4 5 ... 46 47 48 49 50 \nNumber of sampling locations: 10 \nmethodspecs:\nmethod=coh.sig.fast; tsrange=0 to Inf; nsurrogs=100; weighted=TRUE; sigthresh=0.95;\nscale.min=2; scale.max.input=NULL; sigma=1.05; f0=1\nadj has 88 of 90 off-diagonal entries differing from 0; values range from 0 to 0.990099 \nNumber of splitting steps done: 1 \nNumber of modules in final decomposition: 2 \nModularity values for each step: ",mod1val," ",mod2val," \nThe wmfs slot is: empty\nThe wpmfs slot is: empty"))

  res<-addwmfs(res)
  mod1val<-round(res$modres[[1]]$totQ,4)
  mod2val<-round(res$modres[[2]]$totQ,4)
  expect_equal(capture_output(print(res)),paste0("clust object:\ntimes, a length 50 numeric vector:\n1 2 3 4 5 ... 46 47 48 49 50 \nNumber of sampling locations: 10 \nmethodspecs:\nmethod=coh.sig.fast; tsrange=0 to Inf; nsurrogs=100; weighted=TRUE; sigthresh=0.95;\nscale.min=2; scale.max.input=NULL; sigma=1.05; f0=1\nadj has 88 of 90 off-diagonal entries differing from 0; values range from 0 to 0.990099 \nNumber of splitting steps done: 1 \nNumber of modules in final decomposition: 2 \nModularity values for each step: ",mod1val," ",mod2val," \nThe wmfs slot is: filled\nThe wpmfs slot is: empty"))
})

test_that("test summary.clust",{
  set.seed(101)
  sig<-matrix(.8,5,5)
  diag(sig)<-1
  lents<-50
  dat1<-t(mvtnorm::rmvnorm(lents,mean=rep(0,5),sigma=sig))
  dat2<-t(mvtnorm::rmvnorm(lents,mean=rep(0,5),sigma=sig))
  dat<-rbind(dat1,dat2)
  times<-1:lents
  dat<-cleandat(dat,times,clev=1)$cdat
  coords<-data.frame(Y=rep(0,10),X=1:10)
  method<-"coh.sig.fast"
  res<-clust(dat,times,coords,method,nsurrogs = 100)
  
  h<-summary(res)
  expect_equal(class(h),c("summary_wsyn","list"))
  expect_equal(names(h),c("class","times_start","times_end","times_increment",
                          "sampling_locs",
                          "method","tsrange1","tsrange2","nsurrogs","weighted","sigthresh",
                          "scale.min","scale.max.input","sigma","f0",
                          "num_split_steps","num_final_modules","final_modularity",
                          "wmf_slot_is","wpmf_slot_is"))
  expect_equal(h[[1]],"clust")
  expect_equal(h[[2]],1)
  expect_equal(h[[3]],50)
  expect_equal(h[[4]],1)
  expect_equal(h[[5]],10)
  expect_equal(h[[6]],method)
  expect_equal(h[[7]],0)
  expect_equal(h[[8]],Inf)
  expect_equal(h[[9]],100)
  expect_equal(h[[10]],TRUE)
  expect_equal(h[[11]],.95)
  expect_equal(h[[12]],2)
  expect_equal(h[[13]],"NULL")
  expect_equal(h[[14]],1.05)
  expect_equal(h[[15]],1)
  expect_equal(h[[16]],1)
  expect_equal(h[[17]],2)
  expect_equal(h[[19]],"empty")
  expect_equal(h[[20]],"empty")
})
