library(uwIntroStats)


### Name: polynomial
### Title: Create Polynomials
### Aliases: polynomial
### Keywords: ~kwd1 ~kwd2

### ** Examples

  # Reading in a dataset
  mri <- read.table("http://www.emersonstatistics.com/datasets/mri.txt", header=TRUE)
  attach(mri)
  # Create a polynomial on ldl
  polynomial(ldl, degree=3)



