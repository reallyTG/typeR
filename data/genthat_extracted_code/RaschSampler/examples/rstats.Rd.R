library(RaschSampler)


### Name: rstats
### Title: Calculating Statistics for the Sampled Matrices
### Aliases: rstats
### Keywords: misc

### ** Examples

ctr <- rsctrl(burn_in = 10, n_eff = 5, step=10, seed = 12345678, tfixed = FALSE)
mat <- matrix(sample(c(0,1), 50, replace = TRUE), nr = 10)
rso <- rsampler(mat, ctr)
rso_st <- rstats(rso,phi.range)
unlist(rso_st)

# extract the third generated matrix
# (here, the first is the input matrix)
# and decode it into rsmat

rso2 <- rsextrobj(rso,4,4)
summary(rso2)
rsmat <- rstats(rso2, function(x) matrix(x, nr = rso2$n))
print(rsmat[[1]])

# extract only the first r rows of the third generated matrix

mat<-function(x, nr = nr, r = 3){
  m <- matrix(x, nr = nr)
  m[1:r,]
}
rsmat2 <- rstats(rso2, mat, nr=rso$n, r = 3)
print(rsmat2[[1]])

# apply a user function to the decoded object
print(phi.range(rsmat[[1]]))



