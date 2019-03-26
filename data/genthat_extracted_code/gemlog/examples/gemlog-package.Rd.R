library(gemlog)


### Name: gemlog-package
### Title: File Conversion for 'Gem Infrasound Logger'
### Aliases: gemlog-package gemlog
### Keywords: package

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

## Not run: 
##D ReadGem(0:1, 'raw/000') # read files raw/000/FILE0000.TXT and raw/000/FILE0001.TXT
## End(Not run)




