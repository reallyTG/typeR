n1<-35
n2<-61
x1<-10
x2<-24
xmat<- matrix(c(x2,x1,n2-x2,n1-x1),2,2)

library(Exact)

context("Exact: z-pooled, with gamma=0 and gamma>0")


test_that("pooled",{
  # gamma=1e-06
  expect_equal(
    round(
    exact.test(xmat, alternative="less", beta=1e-06, interval=TRUE, method="z-pooled", npNumbers=1000, to.plot = FALSE)$p.value,4),
    round(
      uncondExact2x2(x1,n1,x2,n2, alternative="less", parmtype="difference", method="wald-pooled", 
                      control=ucControl(nPgrid=1000), gamma=1e-06)$p.value,4)
    )
  # gamma=0
  expect_equal(
    round(
      exact.test(xmat, alternative="less", interval=FALSE, method="z-pooled", npNumbers=1000, to.plot = FALSE)$p.value,4),
    round(
      uncondExact2x2(x1,n1,x2,n2, alternative="less", parmtype="difference", method="wald-pooled", 
                     control=ucControl(nPgrid=1000), gamma=0)$p.value,4)
  )

})



context("Exact: Boschloo")


test_that("less, greater, two.sided",{
  expect_equal(
    round(
      exact.test(xmat, alternative="less", interval=FALSE, 
                 method="Boschloo", npNumbers=1000, to.plot = FALSE)$p.value,4),
    round(
      boschloo(x1,n1,x2,n2, alternative="less", tsmethod="minlike",
               control=ucControl(nPgrid=1000))$p.value,4)
  )
  expect_equal(
    round(
      exact.test(xmat, alternative="greater", interval=FALSE, 
                 method="Boschloo", npNumbers=1000, to.plot = FALSE)$p.value,4),
    round(
      boschloo(x1,n1,x2,n2, alternative="greater", tsmethod="minlike",
               control=ucControl(nPgrid=1000))$p.value,4)
  )
  expect_equal(
    round(
      exact.test(xmat, alternative="two.sided", interval=FALSE, 
                 method="Boschloo", npNumbers=1000, to.plot = FALSE)$p.value,4),
    round(
      boschloo(x1,n1,x2,n2, alternative="two.sided", tsmethod="minlike",
                     control=ucControl(nPgrid=1000))$p.value,4)
  )
  
})


context("Exact: Beger and Boos, 1992 example")


test_that("less, greater, two.sided",{
  n1<-47
  n2<-283
  x1<-14
  x2<-48
  xmat<- matrix(c(x2,x1,n2-x2,n1-x1),2,2)
  # both equal to 0.061 in Berger and Boos, 1994, JASA, 1012-1016. 
  # first gamma=0
  expect_equal(
    round(
      exact.test(xmat, alternative="two.sided", interval=FALSE, 
                 method="z-pooled", npNumbers=1000, to.plot = FALSE)$p.value,4),
    round(
      uncondExact2x2(x1,n1,x2,n2, alternative="two.sided", tsmethod="square", method="wald-pooled",
               control=ucControl(nPgrid=1000))$p.value,4)
  )
  # now gamma=0.001, Beger and Boos (1994) have p(0.001)= 0.037
  # we both get 0.03781
  expect_equal(
    round(
      exact.test(xmat, alternative="two.sided", interval=TRUE, beta=0.001, 
                 method="z-pooled", npNumbers=1000, to.plot = FALSE)$p.value,4),
    round(
      uncondExact2x2(x1,n1,x2,n2, alternative="two.sided", tsmethod="square", method="wald-pooled",
                     control=ucControl(nPgrid=1000), gamma=0.001)$p.value,4)
  )
  
})

