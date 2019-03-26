library(empirical)


### Name: plots_bivariate
### Title: Plots Bivariate
### Aliases: plot.epdfmv plot.ecdfmv

### ** Examples

#plot an empirical multivariate cumulative distribution function
#(with m=2)
data (trees)
attach (trees)
ecdfmv.f = ecdfmv (cbind (Height, Volume) )
plot (ecdfmv.f, TRUE)



