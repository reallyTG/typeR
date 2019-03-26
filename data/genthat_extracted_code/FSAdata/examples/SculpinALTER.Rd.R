library(FSAdata)


### Name: SculpinALTER
### Title: Biological data for Slimy Sculpin from the Arctic LTER (AK).
### Aliases: SculpinALTER
### Keywords: datasets

### ** Examples

data(SculpinALTER)
str(SculpinALTER)
head(SculpinALTER)
op <- par(mfrow=c(2,2),pch=19)
hist(SculpinALTER$tl,main="")
hist(SculpinALTER$age,main="")
plot(w~tl,data=SculpinALTER)
plot(tl~age,data=SculpinALTER)
par(op)




