library(FSAdata)


### Name: TroutBR
### Title: Ages and lengths of migratory Brown and Rainbow Trout.
### Aliases: TroutBR
### Keywords: datasets

### ** Examples

data(TroutBR)
str(TroutBR)
head(TroutBR)
op <- par(mfrow=c(1,2),pch=19)
plot(tl~age,data=TroutBR,subset=species=="Brown",main="Brown Trout")
plot(tl~age,data=TroutBR,subset=species=="Rainbow",main="Rainbow Trout")
par(op)




