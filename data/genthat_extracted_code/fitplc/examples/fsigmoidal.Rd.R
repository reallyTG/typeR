library(fitplc)


### Name: fsigmoidal
### Title: Sigmoidal vulnerability curve
### Aliases: fsigmoidal

### ** Examples

curve(fsigmoidal(x, PX=-2, a=5), from=0, to=-5)
curve(fsigmoidal(x, PX=-2, a=2), add=TRUE)

# Comparison to Weibull
curve(fweibull(x, PX=3, SX=40), from=0, to=6)
curve(fsigmoidal(x, PX=3, a=4*(40/100)), add=TRUE, col="red")



