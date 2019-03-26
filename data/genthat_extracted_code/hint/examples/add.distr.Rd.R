library(hint)


### Name: add.distr
### Title: Add Distributions to a Plot
### Aliases: add.distr

### ** Examples

dd <- dhint(25, c(12, 9))
plotDistr(dd)
dd1 <- dhint(12, c(4, 7))
dd2 <- dhint(8, c(4, 2))
add.distr(dd1, dd2, cols = c("blue", "darkgreen"))



