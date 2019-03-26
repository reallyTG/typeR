context("General tests for low level functions")

dist <- dpois(1:10,4)/sum(dpois(1:10,4))
expect_equal(A_to_X_dist(X_to_A_dist(dist)), dist)

