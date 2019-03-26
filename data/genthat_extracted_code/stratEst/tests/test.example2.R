library(stratEst)

test_that("test example 2 of vignette",  {
  set.seed(1)
  id <- c(62,62,62,62,87,87,87,87)
  game <- c(4,4,4,4,4,4,4,4)
  period <- c(1,2,3,4,1,2,3,4)
  input <- c(0,1,2,3,0,1,3,2)
  output <- c(2,2,1,2,2,1,2,1)
  data <- as.data.frame(cbind(id,game,period,input,output))
  strategies <- matrix(c(1,2,3,1,2,0.5,0,1,0.1,NA,0.5,1,0,0.9,NA,2,2,2,2,1,
                         3,3,3,2,1,2,2,2,2,1,3,3,3,2,1),5,7)
  model <- stratEst(data,strategies,print.messages = F)
  expect_equal(0.5,model$shares[1])
  expect_equal(0.5,model$shares[2])
  expect_equal(1,model$strategies[5,2])
  expect_equal(0,model$strategies[5,3])
})


