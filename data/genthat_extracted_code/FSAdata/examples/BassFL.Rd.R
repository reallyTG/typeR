library(FSAdata)


### Name: BassFL
### Title: Catch-at-age for Suwanee and Largemouth Bass.
### Aliases: BassFL
### Keywords: datasets

### ** Examples

data(BassFL)
str(BassFL)
head(BassFL)
op <- par(mfrow=c(3,2),mar=c(3,3,2,1),mgp=c(1.75,0.5,0),tcl=-0.2,pch=19)
plot(log(num)~age,data=BassFL,subset=(loc=="SantaFe" & year==2001 & species=="Suwanee"),
  ylim=c(0,max(log(num))),main="Suwanee, Santa Fe")
points(log(num)~age,data=BassFL,subset=(loc=="SantaFe" & year==2002 & species=="Suwanee"),col="red")
legend("topright",legend=c("2001","2002"),col=c("black","red"),pch=19)
plot(log(num)~age,data=BassFL,subset=loc=="Wacissa" & year==2002 & species=="Suwanee",
 ylim=c(0,max(log(num))),main="Suwanee, Wacissa")
plot(log(num)~age,data=BassFL,subset=loc=="Withlacoochee" & year==2002 & species=="Suwanee",
 ylim=c(0,max(log(num))),main="Suwanee, Withlacoochee")
plot(log(num)~age,data=BassFL,subset=(loc=="SantaFe" & year==2001 & species=="Largemouth"),
 ylim=c(0,max(log(num))),main="Largemouth, Santa Fe")
points(log(num)~age,data=BassFL,subset=(loc=="SantaFe" & year==2002 & species=="Largemouth"),
 col="red")
legend("topright",legend=c("2001","2002"),col=c("black","red"),pch=19)
plot(log(num)~age,data=BassFL,subset=loc=="Ochlockonee" & year==2001 & species=="Largemouth",
 ylim=c(0,max(log(num))),main="Largemouth, Ochlockonee")
points(log(num)~age,data=BassFL,subset=(loc=="Ochlockonee" & year==2002 & species=="Largemouth"),
 col="red")
legend("topright",legend=c("2001","2002"),col=c("black","red"),pch=19)
par(op)




