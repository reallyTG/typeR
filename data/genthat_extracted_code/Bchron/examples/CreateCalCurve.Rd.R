library(Bchron)


### Name: CreateCalCurve
### Title: Create a new calibration curve
### Aliases: CreateCalCurve

### ** Examples

## No test: 
# Load in the calibration curve with:
intcal09 = read.table('http://www.radiocarbon.org/IntCal09%20files/intcal09.14c',sep=',')
# Run CreateCalCurve
CreateCalCurve(name='intcal09',cal_ages=intcal09[,1],uncal_ages=intcal09[,2],one_sigma=intcal09[,3])

# Calibrate the ages under two calibration curves
age_09 = BchronCalibrate(age=15500, ageSds=150,
                         calCurves = 'intcal09',ids='My Date', 
                         pathToCalCurves = getwd())
age_13 = BchronCalibrate(age=15500,ageSds=150,calCurves = 'intcal13')

# Finally plot the difference
plot(age_09)
with(age_13$Date1,lines(ageGrid,densities,col='red'))
legend('topleft',legend=c('intcal09','intcal13'),col=c('black','red'),lty=1)
## End(No test)




