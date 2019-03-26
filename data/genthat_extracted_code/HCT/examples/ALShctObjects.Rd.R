library(HCT)


### Name: ALShctObjects
### Title: Objects Created by hct for the ALS of Clinical Trial Results
### Aliases: ALShctObjects hct220ALSFRS hct220Delta
### Keywords: datasets

### ** Examples

data(ALShctObjects)
#calculate the p-value of an ALS clinical trial where he
#slope of the ALSRS was -2 with standard Error 0.2
hct220ALSFRS$power(-.2,0,.2)
#Calculate the criteria for a p-value of 0.10 one sided to us in #a pilot study
hct220ALSFRS$criteria(0.1,.2)



