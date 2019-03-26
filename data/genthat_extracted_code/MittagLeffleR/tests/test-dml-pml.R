library(MittagLeffleR)
context("Does dml() integrate to pml()?")

tailvec <- seq(0.4, 0.9, 0.1)
scalevec <- 10^seq(-3,3,1)
pvec <- seq(0.1, 0.9, 0.1)
tol <- 0.01

test_that("dml() integrates to pml() for Type 1", {
  for (tail in tailvec){
    for (scale in scalevec){
      ml_dens <- function(x) {
        dml(x = x, tail = tail, scale = scale, second.type = FALSE)
      }
      qvec <- qml(pvec, tail, scale, second.type = FALSE)
      for (i in 1:(length(qvec)-1)){
                p2 <- integrate(ml_dens, qvec[i], qvec[i+1])$value
        expect_equal(object = p2, expected = pvec[i+1]-pvec[i], tol=tol, 
                     info = paste("tail=", toString(tail), 
                                  "scale=", toString(scale),
                                  "q=", toString(qvec[i]), 
                                  "p=", toString(pvec[i]), 
                                  "p2=", toString(p2)))
      }
    }
  }
})

test_that("dml() integrates to pml() for Type 2", {
  for (tail in tailvec){
    for (scale in scalevec){
      qvec <- qml(pvec, tail, scale, second.type = TRUE)
      ml_dens <- function(x) {
        dml(x = x, tail = tail, scale = scale, second.type = TRUE)
      }
      for (i in 1:(length(qvec)-1)){
        p2 <- suppressWarnings(integrate(ml_dens, qvec[i], qvec[i+1])$value)
        expect_equal(object = p2, expected = pvec[i+1]-pvec[i], tol=tol,
                     info = paste("tail=", toString(tail), 
                                  "scale=", toString(scale),
                                  "q=", toString(qvec[i]), 
                                  "p=", toString(pvec[i]), 
                                  "p2=", toString(p2)))
      }
    }
  }
})

