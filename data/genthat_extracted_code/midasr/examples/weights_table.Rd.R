library(midasr)


### Name: weights_table
### Title: Create a weight function selection table for MIDAS regression
###   model
### Aliases: weights_table

### ** Examples


data("USunempr")
data("USrealgdp")
y <- diff(log(USrealgdp))
x <- window(diff(USunempr),start=1949)
trend <- 1:length(y)
mwr <- weights_table(y~trend+fmls(x,12,12,nealmon),
                     start=list(x=list(nealmon=rep(0,3),
                     nbeta=c(1,1,1,0))))

mwr




