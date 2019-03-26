library(clhs)


### Name: clhs-package
### Title: Conditioned Latin Hypercube Sampling
### Aliases: clhs-package
### Keywords: sampling

### ** Examples


df <- data.frame(
  a = runif(1000), 
  b = rnorm(1000), 
  c = sample(LETTERS[1:5], size = 1000, replace = TRUE)
)
res <- clhs(df, size = 50, iter = 2000, progress = FALSE)
str(res)




