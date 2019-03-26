library(midasr)


### Name: plot_midas_coef
### Title: Plot MIDAS coefficients
### Aliases: plot_midas_coef

### ** Examples

data("USrealgdp")
data("USunempr")

y <- diff(log(USrealgdp))
x <- window(diff(USunempr), start = 1949)
trend <- 1:length(y)

##24 high frequency lags of x included
mr <- midas_r(y ~ trend + fmls(x, 23, 12, nealmon), start = list(x = rep(0, 3)))

plot_midas_coef(mr)



