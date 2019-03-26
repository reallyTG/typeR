n1<-35
n2<-61
x1<-21
x2<-25


n1<-7
n2<-6
x1<-6
x2<-0


library(exact2x2)
library(Exact)

context("FisherAdj Difference: Compare Tests at Confidence Limits to p-values")


test_that("FisherAdj Difference",{
  out<-uncondExact2x2(x1,n1,x2,n2, alternative="less", parmtype="difference", method="FisherAdj", conf.int=TRUE)
  expect_equal(
    round(uncondExact2x2(x1,n1,x2,n2, alternative="less", parmtype="difference", method="FisherAdj", 
                         nullparm=out$conf.int[2],conf.int=FALSE)$p.value,4), 0.05)
  out<-uncondExact2x2(x1,n1,x2,n2, alternative="greater", parmtype="difference", method="FisherAdj", conf.int=TRUE)
  expect_equal(
    round(uncondExact2x2(x1,n1,x2,n2, alternative="greater", parmtype="difference", method="FisherAdj", 
                         nullparm=out$conf.int[1],conf.int=FALSE)$p.value,4), 0.05)
  out<-uncondExact2x2(x1,n1,x2,n2, alternative="two.sided", parmtype="difference", method="FisherAdj", conf.int=TRUE)
  expect_equal(
    round(uncondExact2x2(x1,n1,x2,n2, alternative="two.sided", parmtype="difference", method="FisherAdj", 
                         nullparm=out$conf.int[1],conf.int=FALSE)$p.value,4), 0.05)
  expect_equal(
    round(uncondExact2x2(x1,n1,x2,n2, alternative="two.sided", parmtype="difference", method="FisherAdj", 
                         nullparm=out$conf.int[2],conf.int=FALSE)$p.value,4), 0.05)
  
})




context("FisherAdj Ratio: Compare Tests at Confidence Limits to p-values")


test_that("FisherAdj Ratio",{
  out<-uncondExact2x2(x1,n1,x2,n2, alternative="less", parmtype="ratio", method="FisherAdj", conf.int=TRUE)
  if (out$conf.int[2]<Inf){
  expect_equal(
    round(uncondExact2x2(x1,n1,x2,n2, alternative="less", parmtype="ratio", method="FisherAdj", 
                         nullparm=out$conf.int[2],conf.int=FALSE)$p.value,4), 0.05)
  }
  out<-uncondExact2x2(x1,n1,x2,n2, alternative="greater", parmtype="ratio", method="FisherAdj", conf.int=TRUE)
  if (out$conf.int[1]>0){
      expect_equal(
         round(uncondExact2x2(x1,n1,x2,n2, alternative="greater", parmtype="ratio", method="FisherAdj", 
                         nullparm=out$conf.int[1],conf.int=FALSE)$p.value,4), 0.05)
  }
  out<-uncondExact2x2(x1,n1,x2,n2, alternative="two.sided", parmtype="ratio", method="FisherAdj", conf.int=TRUE)
  if (out$conf.int[1]>0){
  expect_equal(
    round(uncondExact2x2(x1,n1,x2,n2, alternative="two.sided", parmtype="ratio", method="FisherAdj", 
                         nullparm=out$conf.int[1],conf.int=FALSE)$p.value,4), 0.05)
  }
  if (out$conf.int[2]<Inf){  
    expect_equal(
    round(uncondExact2x2(x1,n1,x2,n2, alternative="two.sided", parmtype="ratio", method="FisherAdj", 
                         nullparm=out$conf.int[2],conf.int=FALSE)$p.value,4), 0.05)
  }
})




context("FisherAdj Odds Ratio: Compare Tests at Confidence Limits to p-values")


test_that("FisherAdj Odds Ratio",{
  out<-uncondExact2x2(x1,n1,x2,n2, alternative="less", parmtype="oddsratio", method="FisherAdj", conf.int=TRUE)
  if (out$conf.int[2]<Inf){
    expect_equal(
      round(uncondExact2x2(x1,n1,x2,n2, alternative="less", parmtype="oddsratio", method="FisherAdj", 
                         nullparm=out$conf.int[2],conf.int=FALSE)$p.value,4), 0.05)
  }
out<-uncondExact2x2(x1,n1,x2,n2, alternative="greater", parmtype="oddsratio", method="FisherAdj", conf.int=TRUE)
if (out$conf.int[1]>0){
  expect_equal(
    round(uncondExact2x2(x1,n1,x2,n2, alternative="greater", parmtype="oddsratio", method="FisherAdj", 
                         nullparm=out$conf.int[1],conf.int=FALSE)$p.value,4), 0.05)
}
out<-uncondExact2x2(x1,n1,x2,n2, alternative="two.sided", parmtype="oddsratio", method="FisherAdj", conf.int=TRUE)
if (out$conf.int[1]>0){
  expect_equal(
    round(uncondExact2x2(x1,n1,x2,n2, alternative="two.sided", parmtype="oddsratio", method="FisherAdj", 
                         nullparm=out$conf.int[1],conf.int=FALSE)$p.value,4), 0.05)
}
if (out$conf.int[2]<Inf){
expect_equal(
  round(uncondExact2x2(x1,n1,x2,n2, alternative="two.sided", parmtype="oddsratio", method="FisherAdj", 
                       nullparm=out$conf.int[2],conf.int=FALSE)$p.value,4), 0.05)
}
})