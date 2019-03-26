library(ncf)


### Name: mSynch
### Title: The mean (cross-)correlation (with bootstrapp CI) for a panel of
###   spatiotemporal data
### Aliases: mSynch
### Keywords: spatial

### ** Examples

# first generate some sample data
x <- expand.grid(1:20, 1:5)[, 1]
y <- expand.grid(1:20, 1:5)[, 2]
# z data from an exponential random field
z <- cbind(
  rmvn.spa(x = x, y = y, p = 2, method = "exp"), 
  rmvn.spa(x = x, y = y, p = 2, method = "exp")
  )

# mean correlation analysis
fit1 <- mSynch(x = z, resamp = 500)
print(fit1)



