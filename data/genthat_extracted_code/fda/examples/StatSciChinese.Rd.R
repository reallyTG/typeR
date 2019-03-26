library(fda)


### Name: StatSciChinese
### Title: Statistical Science in Chinese
### Aliases: StatSciChinese
### Keywords: datasets

### ** Examples

data(StatSciChinese)

i <- 3
StatSci1 <- StatSciChinese[, i, ]
# Where does the pen leave the paper?
plot(StatSci1[, 3], type='l')
thresh <- quantile(StatSci1[, 3], .8)
abline(h=thresh)

sel1 <- (StatSci1[, 3] < thresh)
StatSci1[!sel1, 1:2] <- NA
plot(StatSci1[, 1:2], type='l')

mark <- seq(1, 601, 12)
points(StatSci1[mark, 1], StatSci1[mark, 2])



