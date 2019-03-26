library(OPDOE)


### Name: heights
### Title: male / female heights data
### Aliases: heights
### Keywords: datasets

### ** Examples

data(heights)
attach(heights)
tt <- triangular.test.norm(x=female[1:3],
   y=male[1:3], mu1=170,mu2=176,mu0=164,
   alpha=0.05, beta=0.2,sigma=7)
# Test is yet unfinished, add the remaining values:
tt <- update(tt,x=female[4:7], y=male[4:7])
# Test is finished now



