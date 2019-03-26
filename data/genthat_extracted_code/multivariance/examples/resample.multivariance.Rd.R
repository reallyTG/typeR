library(multivariance)


### Name: resample.multivariance
### Title: resampling (total /m-) multivariance
### Aliases: resample.multivariance

### ** Examples

re.m = resample.multivariance(matrix(rnorm(30*2),nrow = 30),
                        type= "multi",times = 300)$resampled
curve(ecdf(re.m)(x), xlim = c(0,4),main = "empirical distribution of the test statistic under H_0")



