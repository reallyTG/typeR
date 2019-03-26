library(DistributionUtils)


### Name: Bessel K Ratio
### Title: Ratio of Bessel K Functions
### Aliases: besselRatio
### Keywords: math

### ** Examples

nus <- c(0:5, 10, 20)
x <- seq(1, 4, length.out = 11)
k <- 3

raw <- matrix(nrow = length(nus), ncol = length(x))
scaled <- matrix(nrow = length(nus), ncol = length(x))
compare <- matrix(nrow = length(nus), ncol = length(x))

for (i in 1:length(nus)){
    for (j in 1:length(x)) {
        raw[i,j] <- besselRatio(x[j], nus[i],
                                orderDiff = k)
        scaled[i,j] <- besselRatio(x[j], nus[i],
                                orderDiff = k, useExpScaled = 1)
        compare[i,j] <- raw[i,j]/scaled[i,j]
    }
}
raw
scaled
compare




