library(photobiologyLEDs)


### Name: leds.mspct
### Title: Spectral irradiance for diverse LEDs
### Aliases: leds.mspct
### Keywords: datasets

### ** Examples

library(photobiology)
library(ggspectra)

names(leds.mspct)

leds.mspct$white

cat(getWhatMeasured(leds.mspct$white))

peaks(leds.mspct$white, span = 100)

range(leds.mspct$white)

stepsize(leds.mspct$white)

plot(leds.mspct$white)

intersect(led_engin, blue_leds)

leds.mspct[intersect(led_engin, blue_leds)]




