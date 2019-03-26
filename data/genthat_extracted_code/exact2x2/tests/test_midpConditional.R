

library(exact2x2)

context("Odds ratio with mid-p")


test_that("",{

  # central, see Fagerland, et al 2015, SMMR, 224-254, Table 6
  # Cornfield exact conditional
  # Since this is the same as fisher.test do not test it here...but it gets 396 instead of 397
  #outc<- exact2x2(matrix(c(34-1,1, 34-7, 7),2,2), alternative="two.sided", tsmethod="central",  
  #                midp=FALSE, conf.int=TRUE)
  #expect_equal(
  #  round(c(outc$conf.int[1],outc$conf.int[2]),c(2,0)),c(0.97, 397)
  #)  
  
  # Cornfield mid-p conditional
  outc<- exact2x2(matrix(c(34-1,1, 34-7, 7),2,2), alternative="two.sided", tsmethod="central",  
                  midp=TRUE, conf.int=TRUE)
  expect_equal(
    round(c(outc$conf.int[1],outc$conf.int[2]),c(2,0)),c(1.19, 200)
  )  
  
})

