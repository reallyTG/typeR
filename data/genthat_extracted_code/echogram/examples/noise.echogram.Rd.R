library(echogram)


### Name: noise.echogram
### Title: Modelling ambient noise in echograms
### Aliases: noise.echogram
### Keywords: manip

### ** Examples

# load echogram for noise estimation at 120 kHz (deep waters, no scatterers)
data("echo.noise")
attr(echo.noise$Sv, "frequency")
echogram(echo.noise, xref = "ping")

# a first look to the Sv values at ping 2
noise.echogram(echo.noise, ping = 2)

# To better adjust the model, we need to provide the absortion coefficient for 120 kHz and adjust
# the dB1m parameter. For this example, using data from a nearby CTD profile, alpha was calculated
# as being 0.03550554, while -131 dB is choosen for dB1m
noise <- noise.echogram(echo.noise, ping = 2, dB1m = -131, alpha = 0.03550554, out = TRUE)
echogram(noise)



