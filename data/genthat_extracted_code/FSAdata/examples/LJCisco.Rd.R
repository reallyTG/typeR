library(FSAdata)


### Name: LJCisco
### Title: Ages and lengths of Longjaw Cisco from two locations in Lake
###   Michigan.
### Aliases: LJCisco
### Keywords: datasets

### ** Examples

data(LJCisco)
str(LJCisco)
head(LJCisco)
op <- par(mfrow=c(1,2))
plot(tl~age,data=LJCisco,subset=loc=="NE",main="northeast")
plot(tl~age,data=LJCisco,subset=loc=="S",main="south")
par(op)




