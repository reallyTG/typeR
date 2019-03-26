library(Bchron)


### Name: sampleAges
### Title: Get sample ages from a set of Bchron calibrated dates
### Aliases: sampleAges

### ** Examples

# Calibrate multiple ages and summarise them
ages = BchronCalibrate(ages=c(3445,11553,7456),ageSds=c(50,230,110),
                       calCurves=c('intcal13','intcal13','shcal13'))
# Get samples
age_samples = sampleAges(ages)
# Create a credible interval and the median for each date
apply(age_samples, 2, quantile, probs = c(0.05, 0.5, 0.95))



