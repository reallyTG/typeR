library(teigen)


### Name: plot.teigen
### Title: plot.teigen: Plotting Function for tEIGEN Objects
### Aliases: plot.teigen

### ** Examples

set.seed(2521)
tfaith <- teigen(faithful, models = "CCCC", Gs = 1:4, verbose = FALSE)

plot(tfaith, what = "uncertainty", cex = 1.5, uncmult = 1.5)
plot(tfaith, what = "contour")
plot(tfaith, ymarg = NULL, lwd = 2)



