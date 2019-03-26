library(Bchron)


### Name: hdr
### Title: Calculate highest density regions for Bchron calibrated ages
### Aliases: hdr

### ** Examples

# Calibrate multiple ages and summarise them
ages = BchronCalibrate(ages=11553,ageSds=230,
                       calCurves='intcal13')
# Get samples
hdr(ages$Date1)



