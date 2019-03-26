library(accelmissing)


### Name: valid.days
### Title: Select the Valid Days
### Aliases: valid.days
### Keywords: accelerometer accelmissing

### ** Examples

data(acceldata); attach(acceldata) # read data
	
# filtering data for valid days
valid.days.out = valid.days(PA, label, flag, wear.hr=8,  time.range=c("09:00","20:59"))
ls(valid.days.out)



