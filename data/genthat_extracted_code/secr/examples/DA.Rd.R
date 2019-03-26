library(secr)


### Name: BUGS
### Title: Convert Data To Or From BUGS Format
### Aliases: read.DA write.DA
### Keywords: IO

### ** Examples


write.DA (hornedlizardCH, buffer = 100, units = 100)

## In this example, the input uses Xl, Xu etc.
## for the limits of the plot itself, so buffer = 0.
## Input is in hundreds of metres.
## First, obtain the list lzdata
olddir <- setwd (system.file("extdata", package="secr"))
source ("lizarddata.R")
setwd(olddir)
str(lzdata)
## Now convert to capthist
tempcapt <- read.DA(lzdata, Y = "H", xcoord = "X",
    ycoord = "Y", buffer = 0, units = 100)
#summary(tempcapt)

## Not run: 
##D plot(tempcapt)
##D secr.fit(tempcapt, trace = FALSE)
##D ## etc.
## End(Not run)



