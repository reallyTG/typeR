context('SAR works')

test_that('predicted SAR values are correct', {
  ## values of S0, N0, A0 and predicted S for SAR from Newman et al. 
  bell.sar <- meteSAR(S0=32, N0=920, Amin=1, A0=16)$pred$S
  newmanS <- c(12.2560715, 15.8991283, 20.2158684, 25.7856639, 32)
  expect_true(all(round(bell.sar, 3) == round(newmanS, 3)))
})

test_that('SAR works for absolute and scaled area in the same way', {
  expect_equal(meteSAR(S0=30, N0=1000, Amin=1, A0=16)$pred$S,
               meteSAR(S0=30, N0=1000, Amin=1/16, A0=1)$pred$S)
})

test_that('EAR works for absolute and scaled area in the same way', {
  expect_equal(meteSAR(S0=30, N0=1000, Amin=1, A0=16, EAR=TRUE)$pred$S,
               meteSAR(S0=30, N0=1000, Amin=1/16, A0=1, EAR=TRUE)$pred$S)
})


test_that('predicted EAR values are correct', {
  ## values of S0, N0, A0 and predicted S for Harte 2011
  areas <- 2^(-1*(0:8)) * 256 # Serpentine areas
  S0 <- 24
  N0 <- 37182
  A0 <- 256
  
  actualEAR <- c(24, 2.463750688, 0.926066846, 0.383568393, 0.172749621, 
                 0.081772281, 0.039729318, 0.01957142, 0.009711572)
  
  this.esf <- meteESF(S0=S0, N0=N0)
  serpEAR <- downscaleSAR(this.esf, areas, A0=A0, EAR=TRUE)
  expect_true(all(abs(serpEAR$S - actualEAR) < actualEAR*0.005))
})
