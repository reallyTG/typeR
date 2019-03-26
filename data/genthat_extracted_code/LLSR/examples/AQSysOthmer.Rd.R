library(LLSR)


### Name: AQSysOthmer
### Title: Othmer's Equation - Tieline's correlation
### Aliases: AQSysOthmer

### ** Examples

# dataSET is a data.frame which contains series of Tieline's mass fraction
# (upper-rich component, bottom-rich component and water)
# Each column in the data.frame represents a series of one component mass fraction
# For example, an empty data.frame for four tielines can be obtaining using:
dataSET<-matrix(NA,nrow=4,ncol=6)
# Variables order must follows the sequence presented below:
# "mfXt","mfYt","mfXb","mfYb","mfWt","mfWb"
# In which: mf stands for mass fraction; X and Y for the component
# rich in bottom and upper phase, respectively; t or b for top and
# bottom phases.
# Then you just need to load the data.frame in the function:
## Not run: 
##D AQSysOthmer(dataSET, Order = "xy")
## End(Not run)



