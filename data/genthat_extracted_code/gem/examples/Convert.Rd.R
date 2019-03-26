library(gem)


### Name: Convert
### Title: Convert raw Gem data to segy
### Aliases: Convert
### Keywords: IO

### ** Examples

## Not run: 
##D # define bitweight for 0.5 inch sensor with Rg = 2.2k
##D sensitivity = 22.014e-6 # 22.014 uV/Pa
##D Rg = 2.2 # gain-setting resistor value in kilo-ohms
##D gain = 1 + 49.4/2.2 # amplifier gain
##D A2D = 0.256/2^15 # volts per count in analog-digital converter
##D bitweight = A2D / (gain * sensitivity) # conversion from counts to Pa (Pa/count)
##D 
##D # convert files from two Gems (SNs 000 and 001)
##D Convert('raw/000', bitweight = bitweight)
##D Convert('raw/001', bitweight = bitweight)
## End(Not run)



