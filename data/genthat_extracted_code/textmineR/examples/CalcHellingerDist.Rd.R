library(textmineR)


### Name: CalcHellingerDist
### Title: Calculate Hellinger Distance
### Aliases: CalcHellingerDist

### ** Examples

x <- rchisq(n = 100, df = 8)
y <- x^2
CalcHellingerDist(x = x, y = y)

mymat <- rbind(x, y)
CalcHellingerDist(x = mymat)



