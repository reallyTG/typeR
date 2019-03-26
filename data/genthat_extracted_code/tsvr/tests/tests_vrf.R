context("vrf")

test_that("test for correct format",{
  set.seed(101)
  X<-matrix(runif(10*100),10,100)
  res<-vrf(X)  
  expect_equal(class(res),"list")
  expect_equal(names(res),c("frequency","vr"))
  expect_equal(res$frequency,(1:99)/100)
})

test_that("test for correctvalue",{
  set.seed(102)
  X<-matrix(runif(2*100),2,100)
  res<-vrf(X)  
  fft1<-fft(X[1,])
  fft1<-fft1[2:length(fft1)]
  fft2<-fft(X[2,])
  fft2<-fft2[2:length(fft2)]
  cosp11<-(Mod(fft1))^2
  cosp22<-(Mod(fft2))^2
  cosp12<-fft1*Conj(fft2)
  cosp21<-fft2*Conj(fft1)
  hres<-(cosp11+cosp22+cosp12+cosp21)/(cosp11+cosp22)
  expect_equal(res$vr,Re(hres))
})


