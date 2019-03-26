library(npsurv)


### Name: Uhaz
### Title: U-shaped Hazard Function Estimation
### Aliases: Uhaz Uhaz.object
### Keywords: function

### ** Examples

## Interval-censored observations
data(ap)
(r = Uhaz(ap, deg=0))
plot(r, ylim=c(0,.3), col=1)
for(i in 1:6) plot(Uhaz(ap, deg=i/2), add=TRUE, col=i+1)
legend(15, 0.01, paste0("deg = ", 0:6/2), lwd=2, col=1:7, xjust=1, yjust=0)

## Exact observations
data(nzmort)
x = with(nzmort, nzmort[ethnic=="maori",])[,1:2]   # Maori mortality
(h0 = Uhaz(x[,1]+0.5, x[,2], deg=0)$h)     # U-shaped hazard
(h1 = Uhaz(x[,1]+0.5, x[,2], deg=1)$h)     # convex hazard
(h2 <- Uhaz(x[,1]+0.5, x[,2], deg=2)$h)    # smooth U-shaped hazard

plot(h0, pch=2)                            # plot hazard functions
plot(h1, add=TRUE, col="green3", pch=1)
plot(h2, add=TRUE, col="red3", pch=19)

age = 0:max(x[,1])                         # plot densities
count = integer(length(age))
count[x[,"age"]+1] = x[,"deaths"]
barplot(count/sum(count), space=0, col="lightgrey")
axis(1, pos=NA, at=0:10*10)
plot(h0, fn="d", add=TRUE, pch=2)
plot(h1, fn="d", add=TRUE, col="green3", pch=1)
plot(h2, fn="d", add=TRUE, col="red3", pch=19)

plot(h0, fn="s", pch=2)                    # plot survival functions
plot(h1, fn="s", add=TRUE, col="green3", pch=1)
plot(h2, fn="s", add=TRUE, col="red3", pch=19)

## Exact and right-censored observations
data(gastric)
plot(h0<-Uhaz(gastric, deg=0)$h)           # plot hazard functions
plot(h1<-Uhaz(gastric, deg=1)$h, add=TRUE, col="green3")
plot(h2<-Uhaz(gastric, deg=2)$h, add=TRUE, col="red3")

plot(npsurv(gastric), fn="s", col="grey")  # plot survival functions
plot(h0, fn="s", add=TRUE)
plot(h1, fn="s", add=TRUE, col="green3")
plot(h2, fn="s", add=TRUE, col="red3")



