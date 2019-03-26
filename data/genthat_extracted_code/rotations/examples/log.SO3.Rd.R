library(rotations)


### Name: log.SO3
### Title: Rotation logarithm
### Aliases: log.SO3

### ** Examples

Rs <- ruars(20, rcayley)

#Here we demonstrate how the logarithm can be used to determine the angle and
#axis corresponding to the provided sample

lRs <- log(Rs)               #Take the logarithm of the sample
Ws <- lRs[,c(6, 7, 2)]       #The appropriate diagonal entries are the axis*angle
lens <- sqrt(rowSums(Ws^2))
axes <- mis.axis(Rs)
angs <- mis.angle(Rs)
all.equal(axes, Ws/lens)
all.equal(angs, lens)



