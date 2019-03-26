library(dfphase1)


### Name: mphase1
### Title: Distribution-free Phase I analysis of multivariate data
### Aliases: mphase1
### Keywords: htest multivariate statistical process monitoring statistical
###   process control distribution-free methods

### ** Examples

  # A simulated in-control data from a Student's t distribution
  # with 3 degrees of freedom
  set.seed(123)
  x <- sweep(array(rnorm(5*5*50),c(5,5,50)),c(2,3),sqrt(rchisq(5*50,3)/3),"/")
  mphase1(x)
  # Reproduction of the two examples given in Capizzi and Masarotto (2016)
  data(ryan)
  mphase1(ryan)
  data(gravel)
  mphase1(gravel)



