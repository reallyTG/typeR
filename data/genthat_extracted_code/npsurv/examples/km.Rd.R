library(npsurv)


### Name: km
### Title: Kaplan-Meier Estimation
### Aliases: km
### Keywords: function

### ** Examples

x = cbind(1:5, c(1,Inf,3,4,Inf))
(f = km(x)$f)
plot(f)

data(leukemia)
i = leukemia[,"group"] == "Placebo"
plot(km(leukemia[i,1:2])$f, xlim=c(0,40), col="green3") # placebo
plot(km(leukemia[!i,1:2])$f, add=TRUE)                  # 6-MP



