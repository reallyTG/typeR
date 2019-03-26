library(multicon)


### Name: meanif
### Title: Mean
### Aliases: meanif
### Keywords: mean missing values

### ** Examples

data(RSPdata)
RSPdata$sEXT #no missing values 
meanif(RSPdata$sEXT,nomiss=1)
RSPdata$sEXT[100] <- NA #now we make one value missing
meanif(RSPdata$sEXT,nomiss=1) #returns NA
meanif(RSPdata$sEXT,nomiss=.8) #returns value




