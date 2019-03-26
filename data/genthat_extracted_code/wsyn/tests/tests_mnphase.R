context("mnphase")

test_that("test the mnphase function",{
  x<-complex(real=c(1,-1),imaginary=c(0,0))
  expect_equal(all(is.na(mnphase(x))),TRUE)
  
  x<-c(complex(modulus=2,argument=seq(from=0,by=2*pi/12,length.out=12)),complex(real=1,imaginary=1))
  expect_equal(mnphase(x),pi/4)
})