library(pubh)


### Name: qq_plot
### Title: Quantile-quantile plots against the standard Normal
###   distribution.
### Aliases: qq_plot

### ** Examples

data(kfm, package = "ISwR")
qq_plot(~ dl.milk, data = kfm, ylab = "Breast-milk intake (dl/day)")
qq_plot(~ dl.milk|sex, data = kfm, ylab = "Breast-milk intake (dl/day)", aspect = 1)



