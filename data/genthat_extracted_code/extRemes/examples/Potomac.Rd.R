library(extRemes)


### Name: Potomac
### Title: Potomac River Peak Stream Flow Data.
### Aliases: Potomac
### Keywords: datasets

### ** Examples

data(Potomac)
str(Potomac)
# Fig. 3 of Katz et al. (2002) Sec. 2.3.2.
plot(Potomac[,"Year"], Potomac[,"Flow"]/1000, yaxt="n", ylim=c(0,500), type="l", lwd=1.5,
    xlab="Water Year (Oct-Sept)", ylab="Annual peak flow (thousand cfs)")
axis(2,at=seq(0,500,100),labels=as.character(seq(0,500,100)))



