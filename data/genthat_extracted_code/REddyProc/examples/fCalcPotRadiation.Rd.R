library(REddyProc)


### Name: fCalcPotRadiation
### Title: fCalcPotRadiation
### Aliases: fCalcPotRadiation

### ** Examples

hour <- seq(8, 16, by = 0.1)
potRadSolar <- fCalcPotRadiation(160, hour, 39.94, -5.77, TimeZone =+ 1)
potRadLocal <- fCalcPotRadiation(160, hour, 39.94, -5.77, TimeZone =+ 1
	, useSolartime.b = FALSE)
plot(potRadSolar ~ hour, type = 'l')
abline(v = 13, lty = "dotted")
lines(potRadLocal ~  hour, col = "blue")
abline(v = 12, col = "blue", lty = "dotted")
legend("bottomright", legend = c("solar time", "local winter time")
	, col = c("black", "blue"), inset = 0.05, lty = 1)



