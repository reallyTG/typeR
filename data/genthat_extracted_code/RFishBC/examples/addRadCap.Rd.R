library(RFishBC)


### Name: addRadCap
### Title: Add total radius-at-capture to wide increments data.
### Aliases: addRadCap
### Keywords: manip

### ** Examples

## Get data with radial measurements
data(SMBassWB,package="FSA")
head(SMBassWB)

## convert radial measurements to increments
SMBi1 <- gConvert(SMBassWB,in.pre="anu",out.type="inc")
head(SMBi1)

## add the radius-at-capture measurement
SMBi1a <- addRadCap(SMBi1,in.pre="inc",var.name="radcap2")
head(SMBi1a)




