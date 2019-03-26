library(openintro)


### Name: normTail
### Title: Normal distribution tails
### Aliases: normTail

### ** Examples

par(mfrow = c(2, 3), mar = c(3, 3, 1, 1))
normTail(3, 2, 5)
normTail(3, 2, 1, xLab = 'symbol')
normTail(3, 2, M = 1:2, xLab = 'symbol', cex.axis = 0.8)
normTail(3, 2, U = 5, axes = FALSE)
normTail(L = -1, U = 2, M = c(0, 1), axes = 3, xAxisIncr = 2)
normTail(L = -1, U = 2, M = c(0, 1),
         xLab = 'symbol', cex.axis = 0.8, xAxisIncr = 2)



