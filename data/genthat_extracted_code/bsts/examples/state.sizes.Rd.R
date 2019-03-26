library(bsts)


### Name: state.sizes
### Title: Compute state dimensions
### Aliases: StateSizes
### Keywords: chron

### ** Examples

    y <- rnorm(1000)
    state.specification <- AddLocalLinearTrend(list(), y)
    state.specification <- AddSeasonal(state.specification, y, 7)
    StateSizes(state.specification)



