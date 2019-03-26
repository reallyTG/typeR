library(BaTFLED3D)


### Name: kernelize
### Title: Transform a matrix of input data into a matrix of kernel
###   simmilarities values
### Aliases: kernelize

### ** Examples

m1 <- matrix(rnorm(200), 8, 25, dimnames=list(paste0('sample.', 1:8), paste0('feat.', 1:25)))
m2 <- matrix(rnorm(100), 4, 25, dimnames=list(paste0('sample.', 9:12), paste0('feat.', 1:25)))
kernelize(m1, m1)
kernelize(m1, m1, s=.5)
kernelize(m2, m1)
m1 <- matrix(rbinom(200, 1, .5), 8, 25, 
             dimnames=list(paste0('sample.', 1:8), paste0('feat.', 1:25)))
m2 <- matrix(rbinom(25, 1, .5), 1, 25, 
             dimnames=list(c('sample.9'), paste0('feat.', 1:25)))
kernelize(m1, m1)
kernelize(m2, m1)



