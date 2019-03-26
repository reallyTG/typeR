library(raptr)


### Name: sim.pus
### Title: Simulate planning units
### Aliases: sim.pus

### ** Examples

# generate 225 sqauare planning units arranged in a square
# with 1 unit height / width
x <- sim.pus(225)

# generate 225 rectangular pus arranged in a square
y <- sim.pus(225, xmn = -5, xmx = 10, ymn = -5, ymx = 5)
## No test: 
par(mfrow = c(1, 2))
plot(x, main = "x")
plot(y, main = "y")
par(mfrow = c(1, 1))
## End(No test)




