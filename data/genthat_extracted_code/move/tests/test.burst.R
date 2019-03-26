context('Burst')
test_that('burst',{
data(leroy)
  b<-burst(leroy, f<-(strftime(timestamps(leroy),'%m')[-1]))
  expect_true(validObject(b))
  expect_equivalent(unlist(lapply(s<-split(b), n.locs))-1, as.numeric(table(f)))
  l<-factor(f);levels(l)<- validNames(levels(l))
  expect_equal(l, burstId(b))
  })
test_that("burstId",{
  data(leroy)
  b<-burst(leroy, f<-(strftime(timestamps(leroy),'%m')[-1]))
  burstId(b)<-(i<-rep("a", n.locs(b)-1))
  expect_identical(as.factor(i), burstId(b))
  })
test_that('burst as  data frames',{
  data(leroy)
  b<-burst(leroy, f<-((ff<-strftime(timestamps(leroy),'%m'))[-n.locs(leroy)]))
    expect_equal(d<-as(b,"data.frame"), as.data.frame(b))
    expect_equal(burstId(b), head(d$burstId,-1))
    expect_equal(burstId(b), burst(b))
    leroy$fac<-ff
    b$fac<-ff
    expect_identical(burst(leroy,'fac'),b)
  })
