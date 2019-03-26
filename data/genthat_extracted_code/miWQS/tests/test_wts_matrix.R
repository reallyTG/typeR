context("Defining wts.matrix from wqs.est() output in estimate.wqs and wqs helper functions.")


library(miWQS)
library(wqs)
data(WQSdata)
Wa <- estimate.wqs (y = WQSdata[ , "y"] , WQSdata[ , 1:4], B=10)
wqs.matrix <- Wa$train.estimates[, -(1:6)]
 #Test that this consists of only the weights.
#testthat( )
