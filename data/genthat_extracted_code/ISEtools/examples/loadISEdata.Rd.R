library(ISEtools)


### Name: loadISEdata
### Title: Load ISE calibration and experimental data.
### Aliases: loadISEdata

### ** Examples

###
# Loading the example tab-delimited text files for the lead data
###

# 1. Find pathnames for the lead example txt files:
path.calib = paste(path.package('ISEtools'), "/extdata", 
	"/Lead_calibration.txt", sep="")
path.basic = paste(path.package('ISEtools'), "/extdata", 
	"/Lead_experimentalBasic.txt", sep="")
path.sa = paste(path.package('ISEtools'), "/extdata", 
	"/Lead_experimentalSA.txt", sep="")
# Load the calibration data
lead.example1 = loadISEdata(filename.calibration = path.calib)
print(lead.example1)

# ... and with experimental data, Basic format
lead.example2 = loadISEdata(filename.calibration = path.calib, 
	filename.experimental = path.basic)
print(lead.example2)
	
# ... and with experimental data, Standard Addition format
lead.example3 = loadISEdata(filename.calibration = path.calib, 
	filename.experimental = path.sa)
print(lead.example3)



