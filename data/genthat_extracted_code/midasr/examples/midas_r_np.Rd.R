library(midasr)


### Name: midas_r_np
### Title: Estimate non-parametric MIDAS regression
### Aliases: midas_r_np

### ** Examples

data("USunempr")
data("USrealgdp")
y <- diff(log(USrealgdp))
x <- window(diff(USunempr),start=1949)
trend <- 1:length(y)
midas_r_np(y~trend+fmls(x,12,12))



