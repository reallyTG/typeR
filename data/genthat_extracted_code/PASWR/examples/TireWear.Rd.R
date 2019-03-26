library(PASWR)


### Name: TireWear
### Title: Tire Wear
### Aliases: TireWear
### Keywords: datasets

### ** Examples

par(mfrow=c(1,2), cex=.8)
with(data = TireWear,
interaction.plot(Treat,Block,Wear, type="b", legend=FALSE))
with(data = TireWear, 
interaction.plot(Block,Treat,Wear, type="b", legend=FALSE))
par(mfrow=c(1,1), cex=1)



