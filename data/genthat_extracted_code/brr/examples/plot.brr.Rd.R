library(brr)


### Name: plot.brr
### Title: plot brr
### Aliases: plot.brr

### ** Examples

model <- Brr(a=2, b=3)
plot(model)
plot(model, dprior(mu))
plot(model, dprior(mu), xlim=c(0,4), lwd=3, col="blue")
plot(model, pprior(mu))
plot(model, qprior(mu))
model <- model(c=4, d=6, S=10, T=10)
plot(model)
plot(model, dprior(phi))
plot(model, dprior(x))
model <- model(y=4)
plot(model, dprior(x_given_y))
model <- model(x=5, y=5)
plot(model, dpost(phi))
model <- model(Snew=10, Tnew=10)
plot(model, dpost(x))



