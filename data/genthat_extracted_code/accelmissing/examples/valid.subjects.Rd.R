library(accelmissing)


### Name: valid.subjects
### Title: Include or Exclude Subjects by Criteria
### Aliases: valid.subjects
### Keywords: accelerometer accelmissing

### ** Examples

data(acceldata); attach(acceldata) # read original data
	
# filtering data for valid days
valid.days.out = valid.days(PA, label, flag, wear.hr=8,  time.range=c("09:00","20:59"))
ls(valid.days.out)

# filtering data for valid subjects
x1 = list(PA=PA, label=label, flag=flag) # original data
x2 = valid.days.out                                     # output of valid.days()
valid.sub.out = valid.subjects(data1=x1, data2=x2, valid.days=3)
ls(valid.sub.out)	



