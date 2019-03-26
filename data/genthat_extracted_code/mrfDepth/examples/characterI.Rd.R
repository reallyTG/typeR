library(mrfDepth)


### Name: characterI
### Title: Writing trajectories of the letter i.
### Aliases: characterI
### Keywords: datasets

### ** Examples

data(characterI)
par(mfrow = c(1,2))
matplot(y = characterI[,,1],
        type ="l",col = "black", lty = 1, xlab = "Time", ylab="X position of the pen")
matplot(y = characterI[,,2],
        type ="l",col = "black", lty = 1, xlab = "Time", ylab="Y position of the pen")
par(mfrow = c(1,1))



