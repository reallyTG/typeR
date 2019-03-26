library(MSnID)


### Name: recalibrate
### Title: Post-experimental recalibration of observed mass to charge
###   ratios
### Aliases: recalibrate

### ** Examples

data(c_elegans)

# first let's fix the error of picking wrong monoisotopic peak
# otherwise the mass error range will be very large
msnidObj <- correct_peak_selection(msnidObj)

# original mass error in ppm
ppm <- mass_measurement_error(msnidObj)
hist(ppm, 200, xlim=c(-20,+20))

# The dataset is well calibrated. So let's introduce 
# some mass measurement error.
msnidObj$experimentalMassToCharge <- 
    msnidObj$experimentalMassToCharge * (1+0.00001)

# mass error (in ppm) after artificial de-calibration
ppm <- mass_measurement_error(msnidObj)
hist(ppm, 200, xlim=c(-20,+20))

# recalibration
msnidObj <- recalibrate(msnidObj)
ppm <- mass_measurement_error(msnidObj)
hist(ppm, 200, xlim=c(-20,+20))



