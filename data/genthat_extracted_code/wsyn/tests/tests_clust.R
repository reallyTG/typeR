context("clust")

test_that("test error checking",{
  dat<-matrix(rnorm(300),10,30)
  times<-1:30
  dat<-cleandat(dat,times,2)$cdat
  coords<-data.frame(X=1:10,Y=11:20)
  expect_error(clust(dat,times,coords,"coh",weighted=FALSE),
               "Error in clust: unweighted networks available only if method involves a significance test")
  expect_error(clust(dat,times,coords,"test"),"Error in clust: bad value of method")
  
  coords<-matrix(1:20,10,2)
  expect_error(clust(dat,times,coords,"coh"),"Error in clust: coords must be a data frame")  
  
  coords<-data.frame(X=1:9,Y=11:19)
  expect_error(clust(dat,times,coords,"coh"),"Error in clust: coords must have one row for each row of dat")
  
  coords<-data.frame(A=1:10,B=11:20)
  expect_error(clust(dat,times,coords,"coh"),"Error in clust: coords must have columns X and Y, or lon and lat, or longitude and latitude")
})

test_that("test for correct format",{
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
  expect_true(is.na(res$wmfs))
  expect_true(is.na(res$wpmfs))
})

