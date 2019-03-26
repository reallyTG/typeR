library(univOutl)


### Name: LocScaleB
### Title: Univariate outlier detection with bounds based on robust
###   location and scale estimates
### Aliases: LocScaleB
### Keywords: univar robust survey

### ** Examples


set.seed(333)
x <- rnorm(30, 50, 1)
x[10] <- 1
x[20] <- 100

out <- LocScaleB(x = x,  k = 3, method='MAD')
out$pars
out$bounds
out$outliers
x[out$outliers]

out <- LocScaleB(x = x,  k = 3, method='MAD',
                 return.dataframe = TRUE)
head(out$data)

out <- LocScaleB(x = x, k = 3, method='AdjOut')
out$outliers





