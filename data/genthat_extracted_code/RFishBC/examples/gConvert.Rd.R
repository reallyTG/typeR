library(RFishBC)


### Name: gConvert
### Title: Converts between types of measurements.
### Aliases: gConvert
### Keywords: manip

### ** Examples

## Get data with radial measurements
data(SMBassWB,package="FSA")
head(SMBassWB)

## Use in.pre= to convert to increments
SMBi1 <- gConvert(SMBassWB,in.pre="anu",out.type="inc")
head(SMBi1)

## Use in.var= with column names to convert to increments
SMBi2 <- gConvert(SMBassWB,in.var=c("anu1","anu2","anu3","anu4",
                                    "anu5","anu6","anu7","anu8",
                                    "anu9","anu10","anu11","anu12"),
                           out.type="inc")
head(SMBi2)

## Use in.var with column numbers to convert to increments
SMBi3 <- gConvert(SMBassWB,in.var=8:19,out.type="inc")
head(SMBi3)

## Convert back to radial measurements
SMBr1 <- gConvert(SMBi1,in.pre="inc",out.type="rad")
head(SMBr1)




