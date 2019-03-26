library(FSAdata)


### Name: LakeTroutMI
### Title: Stock and recruitment data for Lake Trout in Lake Superior,
###   1971-1991.
### Aliases: LakeTroutMI
### Keywords: datasets

### ** Examples

data(LakeTroutMI)
LakeTroutMI$stock <- LakeTroutMI$wild+LakeTroutMI$stocked
str(LakeTroutMI)
head(LakeTroutMI)
op <- par(mfrow=c(3,2),pch=19)
plot(recruits~year,data=LakeTroutMI,subset=area=="MI3",type="l",ylim=c(0,max(recruits,na.rm=TRUE)))
lines(recruits~year,data=LakeTroutMI,subset=area=="MI4",col="blue")
lines(recruits~year,data=LakeTroutMI,subset=area=="MI5",col="green")
lines(recruits~year,data=LakeTroutMI,subset=area=="MI6",col="red")
lines(recruits~year,data=LakeTroutMI,subset=area=="MI7",col="yellow")
plot(recruits~stock,data=LakeTroutMI,subset=area=="MI3",main="MI3")
plot(recruits~stock,data=LakeTroutMI,subset=area=="MI4",col="blue",main="MI4")
plot(recruits~stock,data=LakeTroutMI,subset=area=="MI5",col="green",main="MI5")
plot(recruits~stock,data=LakeTroutMI,subset=area=="MI6",col="red",main="MI6")
plot(recruits~stock,data=LakeTroutMI,subset=area=="MI7",col="yellow",main="MI7")
par(op)




