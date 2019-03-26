library(empirical)


### Name: plots_univariate
### Title: Plots Univariate
### Aliases: plot.epdfuv plot.ecdfuv plot.ecdfuv.inverse lines.epdfuv
###   lines.ecdfuv lines.ecdfuv.inverse

### ** Examples

#plot an empirical univariate cumulative distribution function
data (trees)
attach (trees)
ecdfuv.f = ecdfuv (Height)
plot (ecdfuv.f)



