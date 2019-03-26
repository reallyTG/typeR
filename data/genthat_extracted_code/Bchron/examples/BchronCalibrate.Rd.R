library(Bchron)


### Name: BchronCalibrate
### Title: Fast radiocarbon calibration
### Aliases: BchronCalibrate

### ** Examples

# Calibrate a single age
ages1 = BchronCalibrate(ages=11553,ageSds=230,calCurves='intcal13',ids='Date-1')
summary(ages1)
plot(ages1)

# Calibrate multiple ages with different calibration curves
ages2 = BchronCalibrate(ages=c(3445,11553,7456),ageSds=c(50,230,110),
                        calCurves=c('intcal13','intcal13','shcal13'))
summary(ages2)
plot(ages2)

# Calibrate multiple ages with multiple calibration curves and including depth
ages3 = BchronCalibrate(ages=c(3445,11553),ageSds=c(50,230),positions=c(100,150),
                        calCurves=c('intcal13','normal'))
summary(ages3)
plot(ages3,withDepths=TRUE)




