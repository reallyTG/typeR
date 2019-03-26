library(midasr)


### Name: midas_r_simple
### Title: Restricted MIDAS regression
### Aliases: midas_r_simple

### ** Examples


data("USunempr")
data("USrealgdp")
y <- diff(log(USrealgdp))
x <- window(diff(USunempr),start=1949)
trend <- 1:length(y)

X<-fmls(x,11,12)

midas_r_simple(y,X,trend,weight=nealmon,startx=c(0,0,0))



