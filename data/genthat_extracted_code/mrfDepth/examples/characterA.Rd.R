library(mrfDepth)


### Name: characterA
### Title: Writing trajectories of the letter 'a'.
### Aliases: characterA
### Keywords: datasets

### ** Examples

data(characterA)
par(mfrow = c(1,2))
matplot(y = characterA[,,1],
        type ="l",col = "black", lty = 1, xlab = "Time", ylab="X position of the pen")
matplot(y = characterA[,,2],
        type ="l",col = "black", lty = 1, xlab = "Time", ylab="Y position of the pen")
par(mfrow = c(1,1))



