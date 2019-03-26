library(PASWR2)


### Name: TIREWEAR
### Title: Tire Wear
### Aliases: TIREWEAR
### Keywords: datasets

### ** Examples

par(mfrow=c(1, 2), cex = 0.8) 
with(data = TIREWEAR, 
interaction.plot(treat, block, wear, type = "b", legend = FALSE)) 
with(data = TIREWEAR, 
interaction.plot(block, treat, wear, type = "b", legend = FALSE)) 
par(mfrow=c(1, 1), cex = 1)



