context("normforcoh")

test_that("the norm equals none case",{
  set.seed(101)
  W<-array(complex(real=runif(125),imaginary=runif(125)),c(5,5,5))
  expect_equal(normforcoh(W,"none"),W)  
})

test_that("the norm equals phase case",{
  set.seed(101)
  modu<-runif(125,1,2)
  argu<-runif(125,0,2*pi)
  W<-array(complex(modulus=modu,argument=argu),c(5,5,5))
  expect_equal(normforcoh(W,"phase"),array(complex(modulus=1,argument=argu),c(5,5,5)))  
})

test_that("the norm equals powall case",{
  set.seed(101)
  
  #test you get the correct format, vector data case
  W<-array(complex(real=runif(25),imaginary=runif(25)),c(1,5,5))
  expect_equal(dim(normforcoh(W,"powall")),c(1,5,5))
  
  #test you get the correct format, matrix data case
  W<-array(complex(real=runif(125),imaginary=runif(125)),c(5,5,5))
  expect_equal(dim(normforcoh(W,"powall")),c(5,5,5))

  #test the normalization is just dividing by a constant for each timescale
  W<-array(complex(real=runif(125),imaginary=runif(125)),c(5,5,5))
  Wn<-normforcoh(W,"powall")
  q<-W/Wn
  expect_equal(rep(q[1,1,1],25),as.vector(q[,,1]))
  expect_equal(rep(q[1,1,2],25),as.vector(q[,,2]))
  expect_equal(rep(q[1,1,3],25),as.vector(q[,,3]))
  
  #test a specific value
  expect_equal(Re(q[1,1,1]),sqrt(mean((Mod(W[,,1]))^2,na.rm=T)))
})

test_that("the norm equals powind case",{
  set.seed(101)
  
  #test you get the correct format, vector data case
  W<-array(complex(real=runif(25),imaginary=runif(25)),c(1,5,5))
  expect_equal(dim(normforcoh(W,"powind")),c(1,5,5))
  
  #test you get the correct format, matrix data case
  W<-array(complex(real=runif(125),imaginary=runif(125)),c(5,5,5))
  expect_equal(dim(normforcoh(W,"powind")),c(5,5,5))

  #test the normalization is just dividing by a constant for each location and timescale
  W<-array(complex(real=runif(125),imaginary=runif(125)),c(5,5,5))
  Wn<-normforcoh(W,"powind")
  q<-W/Wn
  expect_equal(rep(q[1,1,1],5),as.vector(q[1,,1]))
  expect_equal(rep(q[2,1,3],5),as.vector(q[2,,3]))
  expect_equal(rep(q[2,1,4],5),as.vector(q[2,,4]))
  
  #test a specific value
  expect_equal(Re(q[1,1,1]),sqrt(mean((Mod(W[1,,1]))^2,na.rm=T)))
})
