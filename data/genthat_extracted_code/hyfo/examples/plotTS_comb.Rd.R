library(hyfo)


### Name: plotTS_comb
### Title: Combine time seires plot together
### Aliases: plotTS_comb

### ** Examples

a1 <- plotTS(testdl[[1]], output = 'ggplot', name = 1)
a2 <- plotTS(testdl[[2]], output = 'ggplot', name = 2)

plotTS_comb(a1, a2)
plotTS_comb(list = list(a1, a2), y = 'y axis', nrow = 2)

# More examples can be found in the user manual on https://yuanchao-xu.github.io/hyfo/




