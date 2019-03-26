library(FSAdata)


### Name: BullTroutRML1
### Title: Lengths and weights for Bull Trout from two Rocky Mountain lakes
###   and two eras.
### Aliases: BullTroutRML1
### Keywords: datasets

### ** Examples

data(BullTroutRML1)
str(BullTroutRML1)
head(BullTroutRML1)
op <- par(mfrow=c(1,2),pch=19)
plot(mass~fl,data=BullTroutRML1,subset=era=="1977-79",main="1977-79")
plot(mass~fl,data=BullTroutRML1,subset=era=="2001",main="2001")
par(op)




