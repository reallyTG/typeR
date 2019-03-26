library(npsurv)


### Name: gastric
### Title: Gastric Cancer Survival Data
### Aliases: gastric
### Keywords: datasets

### ** Examples

data(gastric)
plot(npsurv(gastric), col="grey")      # survival function
plot(h0<-Uhaz(gastric, deg=0)$h, fn="s", add=TRUE, col="green3")
plot(h1<-Uhaz(gastric, deg=1)$h, fn="s", add=TRUE)
plot(h2<-Uhaz(gastric, deg=2)$h, fn="s", add=TRUE, col="red3")

plot(h0, fn="h", col="green3")         # hazard function
plot(h1, fn="h", add=TRUE)
plot(h2, fn="h", add=TRUE, col="red3")

plot(h0, fn="d", col="green3")         # density function
plot(h1, fn="d", add=TRUE)
plot(h2, fn="d", add=TRUE, col="red3") 




