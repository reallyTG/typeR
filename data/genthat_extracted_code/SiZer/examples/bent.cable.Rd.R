library(SiZer)


### Name: bent.cable
### Title: Fits a bent-cable model to the given data Fits a bent-cable
###   model to the given data by exhaustively searching the 2-dimensional
###   parameter space to find the maximum likelihood estimators for alpha
###   and gamma.
### Aliases: bent.cable

### ** Examples

data(Arkansas)
x <- Arkansas$year
y <- Arkansas$sqrt.mayflies

# For a more accurate estimate, increase grid.size
model <- bent.cable(x,y, grid.size=20)
plot(x,y)
x.grid <- seq(min(x), max(x), length=200)
lines(x.grid, predict(model, x.grid), col='red')




