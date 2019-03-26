library(StreamMetabolism)


### Name: Cs
### Title: Saturation Concentration at temp
### Aliases: Cs
### Keywords: math

### ** Examples

#single temperature
temp <- sample(20:30, 1)
Cs(temp)

#USGS Data (DOTemp)
library(chron)
library(zoo)
data(DOTemp)
Cs(DOTemp[,1])



