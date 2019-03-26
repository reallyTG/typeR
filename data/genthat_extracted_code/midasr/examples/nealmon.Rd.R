library(midasr)


### Name: nealmon
### Title: Normalized Exponential Almon lag MIDAS coefficients
### Aliases: nealmon

### ** Examples


##Load data
data("USunempr")
data("USrealgdp")

y <- diff(log(USrealgdp))
x <- window(diff(USunempr),start=1949)
t <- 1:length(y)

midas_r(y~t+fmls(x,11,12,nealmon),start=list(x=c(0,0,0)))




