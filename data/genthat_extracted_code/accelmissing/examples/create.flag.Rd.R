library(accelmissing)


### Name: create.flag
### Title: Create a Missing Flag Matrix
### Aliases: create.flag
### Keywords: accelerometer accelmissing

### ** Examples

data(acceldata)  # read data	
PA = acceldata$PA
	
# create a missing flag matrix with 60 minutes criterion 
flag60 = create.flag(PA, window=60, mark.missing=0)

# create a missing flag matrix with 30 minutes criterion
flag30 = create.flag(PA, window=30, mark.missing=0)
	



