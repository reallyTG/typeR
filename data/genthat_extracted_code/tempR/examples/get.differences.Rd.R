library(tempR)


### Name: get.differences
### Title: Get vector of difference in dominance rates
### Aliases: get.differences

### ** Examples

# example using 'bars' data set
bars.m <- aggregate(bars[, -c(1:4)], list(samples = bars$sample, attribute = bars$attribute), mean)
bars.m <- bars.m[order(bars.m$sample, bars.m$attribute), ]
attributes <- unique(bars$attribute)
times <- get.times(colnames(bars.m)[-c(1:2)])
bar1 <- bars.m[bars.m$sample == 1 & bars.m$attribute == "Caramelized Flavour", -c(1:2)]
bar2 <- bars.m[bars.m$sample == 2 & bars.m$attribute == "Caramelized Flavour", -c(1:2)]
b.diff <- get.differences(bar1, bar2)
round(b.diff, 3)

# toy example
x <- data.frame(t10 = c( NA,  0,  0,  0,  1,  1,  0,  0,  1,  0, NA),
                t15 = c(  1,  0,  0,  1,  1,  1,  0,  1,  0,  1,  0),
                t20 = c(  1,  1,  1,  1,  1,  1,  1,  0,  1, NA,  0))
y <- data.frame(t10 = c( NA, NA,  0,  0,  1,  1,  0,  0,  0,  0, NA),
                t15 = c(  0,  0,  0,  0,  1,  0,  1,  1,  0,  1,  1),
                t20 = c(  1,  0,  1,  1,  0,  0,  1, NA,  1, NA,  0))
get.differences(x, y)



