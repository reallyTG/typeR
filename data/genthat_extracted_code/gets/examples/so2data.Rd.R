library(gets)


### Name: so2data
### Title: UK SO2 Data
### Aliases: so2data
### Keywords: datasets emissions

### ** Examples

data(so2data)

##create annual zoo object:
newso2data<- zooreg(so2data[,-1], start=1946, frequency=1)

##plot UK annual total anthropogenic SO2 emissions:
plot(newso2data$uk_tot_so2)




