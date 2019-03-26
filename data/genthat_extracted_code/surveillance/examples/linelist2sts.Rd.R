library(surveillance)


### Name: linelist2sts
### Title: Convert individual case information based on dates into an
###   aggregated time series of counts
### Aliases: linelist2sts
### Keywords: models optimize

### ** Examples

#Load O104 outbreak data
data("husO104Hosp")

#Convert line list to an sts object
sts <- linelist2sts(husO104Hosp, dateCol="dHosp", aggregate.by="1 day")

#Check that the number of cases is correct
all.equal(sum(observed(sts)),nrow(husO104Hosp))

#Plot the result
plot(sts,xaxis.tickFreq=list("%d"=atChange,"%m"=atChange),
           xaxis.labelFreq=list("%d"=at2ndChange),
           xaxis.labelFormat="%d %b",
           xlab="",las=2,cex.axis=0.8)



