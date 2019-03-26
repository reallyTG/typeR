library(countTransformers)


### Name: getJaccard
### Title: Calculate Jaccard Index for Two Binary Vectors
### Aliases: getJaccard
### Keywords: method

### ** Examples

  n = 10
  set.seed(1234567)

  # generate two random binary vector of size n
  cl1 = sample(c(1,0), size = n, prob = c(0.5, 0.5), replace = TRUE)
  cl2 = sample(c(1,0), size = n, prob = c(0.5, 0.5), replace = TRUE)
  cat("\n2x2 contingency table >>\n")
  print(table(cl1, cl2))

  JI = getJaccard(cl1, cl2)
  cat("Jaccard index = ", JI, "\n")





