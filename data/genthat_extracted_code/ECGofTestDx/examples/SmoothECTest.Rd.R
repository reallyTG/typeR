library(ECGofTestDx)


### Name: SmoothECTest
### Title: Smooth Goodness-of-fit Test for Multivariate Elliptical
###   Distributions
### Aliases: SmoothECTest
### Keywords: distribution multivariate htest

### ** Examples

 # The famous (Fisher's or Anderson's) iris data set
 # Increase the value of K to K = 7 for better results.
  ressetosa <- SmoothECTest(iris[1:50, -5], K = 3)
  ressetosa

 # Examination marks (n = 88) in Vectors, Algebra and Statistics from the "Open
 # book-Closed book examination" data set (Mardia, Kent and Bibby, 1979,
 # p. 3-4).
 # Increase the value of K to K = 5 for better results.
  data <- scor[, c(2, 3, 5)]
  result <- SmoothECTest(data, K = 3)
  result



