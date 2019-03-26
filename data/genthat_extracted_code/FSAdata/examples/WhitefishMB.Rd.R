library(FSAdata)


### Name: WhitefishMB
### Title: Ages of Lake Whitefish from four lakes assigned from scales and
###   fin-rays.
### Aliases: WhitefishMB
### Keywords: datasets

### ** Examples

data(WhitefishMB)
str(WhitefishMB)
head(WhitefishMB)
op <- par(mfrow=c(2,2),pch=19)
plot(scale~fin,data=WhitefishMB,subset=lake=="L122",main="Lake L122")
plot(scale~fin,data=WhitefishMB,subset=lake=="L226",main="Lake L226")
plot(scale~fin,data=WhitefishMB,subset=lake=="Huron",main="Huron")
plot(scale~fin,data=WhitefishMB,subset=lake=="Dezadeash",main="Dezadeash")
par(op)




