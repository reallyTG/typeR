library(activity)


### Name: plot.actmod
### Title: Plot activity distribution
### Aliases: plot.actmod

### ** Examples

data(BCItime)
otm <- 2*pi*subset(BCItime, species=="ocelot")$time
btm <- 2*pi*subset(BCItime, species=="brocket")$time
omod <- fitact(otm)
bmod <- fitact(btm)
plot(omod, yunit="density", data="none")
plot(bmod, yunit="density", data="none", add=TRUE, tline=list(col="red"))
legend("topleft", c("Ocelot", "Brocket deer"), col=1:2, lty=1)

mod <- fitact(otm, sample="data", reps=10)
plot(mod, dline=list(col="grey"),
          tline=list(col="red", lwd=2),
          cline=list(col="red", lty=3))

mod2 <- fitact(otm, bounds=c(pi*3/2, pi/2))
plot(mod2, centre="night")
plot(mod2, centre="night", xlim=c(-6,6), xaxis=list(at=seq(-6,6,2)))



