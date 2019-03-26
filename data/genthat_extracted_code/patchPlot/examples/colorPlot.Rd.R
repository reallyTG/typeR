library(patchPlot)


### Name: colorPlot
### Title: colorPlot
### Aliases: colorPlot

### ** Examples

dat <- matrix(runif(16), nrow=4)
dat <- as.data.frame(dat)
rownames(dat) <- colnames(dat) <- c("A", "B", "C", "D")
colorPlot(dat, "green", "red")



