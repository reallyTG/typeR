library(insol)


### Name: p2rho
### Title: Air pressure to density
### Aliases: p2rho

### ** Examples


p2rho(1013, 288, 60)

# plot density vertical profile

z = seq(0, 10000,100)
press = z2p(z)
Tair = 288-0.0065*z
par(mar=c(5.1, 4.5, 4.1, 2.1)) # increase left margin for label
plot(z,p2rho(press,Tair,50),ty='l',xlab='Altitude',
	ylab=expression(paste('Air density [ kg ', m^-3,' ]')))




