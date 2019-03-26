library(FSAdata)


### Name: LakeTroutALTER
### Title: Biological data for Lake Trout from the Arctic LTER (AK).
### Aliases: LakeTroutALTER
### Keywords: datasets

### ** Examples

data(LakeTroutALTER)
str(LakeTroutALTER)
head(LakeTroutALTER)
op <- par(mfrow=c(2,2),pch=19)
## Four (of many possible) examples
hist(LakeTroutALTER$tl,main="")
plot(w~tl,data=LakeTroutALTER)
plot(tl~fl,data=LakeTroutALTER)
plot(tl~age,data=LakeTroutALTER)
par(op)




