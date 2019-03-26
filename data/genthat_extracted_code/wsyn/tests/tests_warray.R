context("warray")

test_that("tests of the format of the output",{
  times<-1:100
  dat<-matrix(rnorm(1000),10,100)
  for (counter in 1:10)
  {
    dat[counter,]<-dat[counter,]-mean(dat[counter,])
  }
  res<-warray(dat, times)
  expect_equal(res$times,times)
  expect_equal(dim(res$wavarray),c(10,length(times),length(res$timescales)))
})

#tests of the accuracy of the transforms not considered necessary
#because warray just calls wt a bunch of times, and wt has been
#tested for accuracy