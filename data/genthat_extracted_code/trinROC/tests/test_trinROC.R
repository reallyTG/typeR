###############################################################################
## test.R ---
## Author          : Samuel Noll
## Document created: 21/12/2017
## Last modified   : ././2018 Descripiton
##                 : ..
###############################################################################
##Purpose: Test the trinROC package.


# In this file we test all functions of trinROC.
# Each function is embedded in one context().
# Order is alphabetically


context("Test boot.test, trinVUS.test and trinROC.test:")

# generate test data:
n<-5
set.seed(1)
x1 <-rnorm(n)
y1 <-rnorm(n, mean=.3)
z1 <-rnorm(n, mean=.6)

x2<-rnorm(n,mean=4,sd=1)
y2<-rnorm(n, mean=5,sd=1.5)
z2<-rnorm(n, mean=6,sd=2)

classes <- gl(3,n, labels = c("D-","D0","D+"))
# combine sampled data with cp (chance plane) and cs (complete separation) data:
dat     <- data.frame(group=classes, FAC1=c(x1,y1,z1), FAC2=c(x2,y2,z2),
                      cp = as.numeric(c(1:5,1:5,1:5)),
                      cs = as.numeric(c(1:5,6:10,11:15)) )

test_that("boot.test() function", {

  # test perfect discrimination (cs):
  temp <- boot.test(dat = dat[,c(1,5)])
  expect_equal(temp$p.value, 0)
  # here emp.vus is tested:
  expect_equal(unname(temp$estimate[1]), 1)

  # test uniformative case (cp):
  temp <- boot.test(dat = dat[,c(1,4)])
  expect_equal(temp$p.value, 1)
  expect_equal(unname(round(temp$estimate[1],3)), 0.167)

  # test sampled data, single assessment:
  temp <- boot.test(dat = dat[,1:2])
  expect_equal(round(temp$p.value,2), 0.24)
  expect_equal(unname(round(temp$estimate[1],3)), 0.368)

  # test sampled data, comparison of markers:
  temp <- boot.test(dat = dat[,1:3])
  expect_equal(round(temp$p.value,2), 0.59)
  expect_equal(unname(round(temp$statistic,3)), 0.537)
  })


test_that("trinVUS.test() function", {

  # test perfect discrimination (cs):
  temp <- trinVUS.test(dat = dat[,c(1,5)])
  expect_equal(round(temp$p.value,3), 0)
  expect_equal(unname(round(temp$estimate[1],3)), 0.926)

  # test uniformative case (cp):
  temp <- trinVUS.test(dat = dat[,c(1,4)])
  expect_equal(temp$p.value, 1)
  expect_equal(unname(round(temp$estimate[1],3)), 0.167)

  # test sampled data, single assessment:
  temp <- trinVUS.test(dat = dat[,1:2])
  expect_equal(round(temp$p.value,2), 0.39)
  expect_equal(unname(round(temp$estimate[1],3)), 0.278)

  # test sampled data, comparison of markers:
  temp <- trinVUS.test(dat = dat[,1:3])
  expect_equal(round(temp$p.value,2), 0.6)
  expect_equal(unname(round(temp$statistic,3)), 0.531)
})


test_that("trinROC.test() function", {

  # test perfect discrimination (cs):
  temp <- trinROC.test(dat = dat[,c(1,5)])
  expect_equal(round(temp$p.value,3), 0)
  expect_equal(unname(round(temp$statistic,3)), 20.426)

  # test uniformative case (cp):
  temp <- trinROC.test(dat = dat[,c(1,4)])
  expect_equal(temp$p.value, 1)
  expect_equal(unname(round(temp$statistic,3)), 0)

  # test sampled data, single assessment:
  temp <- trinROC.test(dat = dat[,1:2])
  expect_equal(round(temp$p.value,2), 0.08)
  # check arbitrarily parameter A:
  expect_equal(as.numeric(round(temp$estimate[2],3)), 0.696)

  # test sampled data, comparison of markers:
  temp <- trinROC.test(dat = dat[,1:3])
  expect_equal(round(temp$p.value,2), 0.45)
  # check arbitrarily parameter D2:
  expect_equal(round(temp$estimate[2,5],3), 0.103)
})


context("Test EDA functions: roc.eda(), rocsurf.emp(), rocsurf.trin():")


test_that("roc.eda(), whole functionality", {

  temp <- roc.eda(dat = dat[,1:2], plotVUS = FALSE)
  expect_equal(unname(round(temp$statistic,3)), 1.163)
  expect_equal(unname(temp$VUS), 0.368)
  expect_equal(unname(round(temp$dat.summary[1,3],3)), 1.201)

  temp <- roc.eda(dat = dat[,1:2], type = "t", plotVUS = FALSE)
  expect_equal(unname(round(temp$statistic,3)), c(8.321,0.868))
  expect_equal(unname(round(temp$VUS,3)), 0.278)
  expect_equal(unname(round(temp$dat.summary[1,3],3)), 1.201)

})


test_that("rocsurf.emp(), whole functionality", {

  temp <- rocsurf.emp(x1, y1, z1, plot=FALSE)
  expect_equal(temp$zVUS[1,], c(0,0,0,0,.2,.2,.4,.4,.4,.6,.8,.8,1,1,1,1))
  temp <- rocsurf.emp(1:5, 1:5, 1:5, plot=FALSE)
  expect_equal(temp$zVUS[1,], c(0,.2,.4,.6,.8,1))

})

test_that("rocsurf.trin(), whole functionality", {

  temp <- rocsurf.trin(x1,y1,z1, plot=FALSE)
  expect_equal(round(temp$zVUS[1,133],3), 0.865)

})



context("Test supplementory functions: emp.vus(), findmu(), boxcoxROC():")


test_that("emp.vus(), whole functionality", {

  expect_true(suppressWarnings(is.na(emp.vus("a","v","c"))))
  expect_error(emp.vus())
  expect_error(emp.vus(x, y))

  # generate test data:
  n<-100
  set.seed(1)
  x<-rnorm(n); y<-rnorm(n, 0.4); z<-rnorm(n, .8)
  classes1 <- gl(3,n, labels = c("D-","D0","D+"))
  classes2 <- gl(3,n, labels = c("c","a","b"))
  dat1     <- data.frame(group=classes1, FAC1=c(x,y,z))
  dat2     <- data.frame(group=classes2, FAC1=c(x,y,z))
  # compare output:
  expect_equal(emp.vus(x,y,z), emp.vus(dat = dat1))
  expect_equal(emp.vus(x,y,z), emp.vus(dat = dat2))
  expect_equal(emp.vus(x,y,z), emp.vus(1,1,1, dat = dat1))
  expect_error(emp.vus(x, y))
})


test_that("boxcoxROC(), whole functionality", {

  temp <- boxcoxROC(x1,y1,z1, lambda2 = abs(min(c(x1,y1,z1)))+6,
                    lambda = seq(-2.01, 2.01, 0.02), eps = 0.03, verbose = F)
  expect_equal(round(temp$xbc[1],3), 19,769)
  expect_equal(round(temp$lambda,3), 1.87)

})


test_that("findmu(), whole functionality", {

  temp <- findmu(mux = 2, sdx = 1, sdy = 2, sdz = 4, VUS = 0.5)
  expect_equal(round(temp$Coeff,3), c(2,3.212,6.424, 0.5))

})



