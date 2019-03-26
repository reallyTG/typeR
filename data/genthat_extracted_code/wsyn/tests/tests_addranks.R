context("addranks")

test_that("test addranks, case in which ranks is already filled",{
  cohobj<-list(test="test",ranks="notNA")
  expect_equal(cohobj,addranks(cohobj))
})

test_that("test addranks, case in which ranks is NA",{
  #first, very simple example
  cohobj<-list(ranks=NA,
               signif=list(coher=c(1,2,3),scoher=matrix(c(2,3,1,3,1,2),2,3)))
  res<-addranks(cohobj)
  expres<-list(ranks=list(coher=c(0,.5,1),scoher=matrix(c(0,1,0,1,0,1),2,3)),
               signif=list(coher=c(1,2,3),scoher=matrix(c(2,3,1,3,1,2),2,3)))
  expect_equal(res,expres)
  
  #another example
  otmat<-matrix(rep(1:10,times=3),10,3)
  cohobj<-list(ranks=NA,
               signif=list(coher=c(2.5,3.5,8.5),scoher=otmat))
  res<-addranks(cohobj)
  expres<-list(ranks=list(coher=c(2/10,3/10,8/10),scoher=(otmat-1)/9),
               signif=list(coher=c(2.5,3.5,8.5),scoher=otmat))
  expect_equal(res$ranks$coher,expres$ranks$coher)
  expect_equal(res$scoher,expres$scoher)
})