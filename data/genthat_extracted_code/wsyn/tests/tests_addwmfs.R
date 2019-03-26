context("addwmfs")

test_that("test it",{
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
  clustobj<-clust(dat,times,coords,method,nsurrogs = 100)
  res<-addwmfs(clustobj)
  
  #old tests, to make sure other parts have not changed
  expect_equal(class(res),c("clust","list"))
  expect_equal(res$dat,dat)
  expect_equal(res$times,times)
  expect_equal(res$coords,coords)
  expect_equal(names(res$methodspecs),c("method","tsrange","nsurrogs",
                                        "scale.min","scale.max.input","sigma","f0",
                                        "weighted","sigthresh"))
  expect_equal(diag(res$adj),rep(NA*numeric(1),10))
  expect_true(isSymmetric(res$adj))
  expect_equal(class(res$clusters),"list")
  h<-sapply(FUN=length,X=res$clusters)
  expect_equal(h,rep(10,length(h)))
  expect_equal(res$clusters[[1]],rep(1,10))
  expect_equal(class(res$modres),"list")
  expect_equal(length(res$modres),length(res$clusters))
  expect_equal(class(res$modres[[1]]),"list")
  expect_equal(names(res$modres[[1]]),c("totQ","modQ","nodeQ"))
  expect_equal(class(res$mns),"list")
  expect_equal(length(res$mns),length(res$clusters))
  expect_equal(dim(res$mns[[1]]),c(1,lents))
  expect_equal(dim(res$mns[[2]]),c(2,lents))
  expect_equal(as.vector(res$mns[[1]]),apply(FUN=mean,X=dat,MARGIN=2))
  
  #now look at wmf part for correct format
  expect_equal(class(res$wmfs),"list")
  expect_equal(length(res$wmfs),length(res$clusters))
  expect_equal(class(res$wmfs[[1]]),"list")
  expect_equal(class(res$wmfs[[2]]),"list")
  expect_equal(length(res$wmfs[[1]]),1)
  expect_equal(length(res$wmfs[[2]]),2)
  expect_equal(class(res$wmfs[[1]][[1]]),c("wmf","tts","list"))
  expect_equal(class(res$wmfs[[2]][[1]]),c("wmf","tts","list"))
  expect_equal(class(res$wmfs[[2]][[2]]),c("wmf","tts","list"))

  #these should be identical
  #plotmag(res$wmfs[[1]][[1]])
  #plotmag(wmf(dat,times))
  
  #these should look identical
  #plotmag(res$wmfs[[2]][[2]])
  #plotmag(wmf(dat[1:5,],times))
  
  #these should look identical
  #plotmag(res$wmfs[[2]][[1]])
  #plotmag(wmf(dat[6:10,],times))
  
  #the above pairs of plots were visually identical, so I commented and test for 
  #consistency through time 
  h<-res$wmfs
  h[[1]][[1]]<-Mod(h[[1]][[1]]$values[20:30,20:30])
  h[[2]][[2]]<-Mod(h[[2]][[2]]$values[20:30,20:30])
  h[[2]][[1]]<-Mod(h[[2]][[1]]$values[20:30,20:30]) #these changes are for file size reasons
  expect_known_value(h,file="../vals/addwmfs_testval_01",update=FALSE)
})
