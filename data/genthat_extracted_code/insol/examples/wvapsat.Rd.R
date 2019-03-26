library(insol)


### Name: wvapsat
### Title: Saturation pressure of water vapor
### Aliases: wvapsat

### ** Examples

## Plot the differences saturation pressure over water and over ice
plot(wvapsat(250:300), xlab='Temperature', ylab='saturation vapour pressure [hPa]')

Tair = 223:273
plot(Tair,wvapsat(Tair),ty='l',lwd=2,col=4,xlab='Temperature', 
	ylab='saturation vapour pressure [hPa]')
lines(Tair,wvapsat(Tair,ice=1),col=8)
legend('topleft',c('saturation pressure over water','saturation pressure over ice'),
col=c(4,8),lwd=2)




