library(FSAdata)


### Name: BullTroutRML2
### Title: Ages and lengths of Bull Trout from two Rocky Mountain lakes at
###   two times.
### Aliases: BullTroutRML2
### Keywords: datasets

### ** Examples

data(BullTroutRML2)
str(BullTroutRML2)
head(BullTroutRML2)
op <- par(mfrow=c(2,2),pch=19)
plot(fl~age,data=BullTroutRML2,subset=lake=="Harrison" & era=="1977-80",main="Harrison, 1977-80")
plot(fl~age,data=BullTroutRML2,subset=lake=="Harrison" & era=="1997-01",main="Harrison, 1997-2001")
plot(fl~age,data=BullTroutRML2,subset=lake=="Osprey" & era=="1977-80",main="Osprey, 1977-80")
plot(fl~age,data=BullTroutRML2,subset=lake=="Osprey" & era=="1997-01",main="Osprey, 1997-2001")
par(op)




