library(tempR)


### Name: get.smooth
### Title: Convenience function for curve smoothing
### Aliases: get.smooth

### ** Examples

# example using 'syrah' data set
low1 <- t(syrah[seq(3, 1026, by = 6), -c(1:4)])
colnames(low1) <- 10:180
x <- get.smooth(low1)
round(x, 3)



