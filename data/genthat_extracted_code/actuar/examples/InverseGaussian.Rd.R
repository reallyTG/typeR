library(actuar)


### Name: InverseGaussian
### Title: The Inverse Gaussian Distribution
### Aliases: InverseGaussian dinvgauss pinvgauss qinvgauss rinvgauss
###   minvgauss levinvgauss mgfinvgauss
### Keywords: distribution

### ** Examples

dinvgauss(c(-1, 0, 1, 2, Inf), mean = 1.5, dis = 0.7)
dinvgauss(c(-1, 0, 1, 2, Inf), mean = Inf, dis = 0.7)
dinvgauss(c(-1, 0, 1, 2, Inf), mean = 1.5, dis = Inf) # spike at zero

## Typical graphical representations of the inverse Gaussian
## distribution. First fixed mean and varying shape; second
## varying mean and fixed shape.
col = c("red", "blue", "green", "cyan", "yellow", "black")
par = c(0.125, 0.5, 1, 2, 8, 32)
curve(dinvgauss(x, 1, par[1]), from = 0, to = 2, col = col[1])
for (i in 2:6)
    curve(dinvgauss(x, 1, par[i]), add = TRUE, col = col[i])

curve(dinvgauss(x, par[1], 1), from = 0, to = 2, col = col[1])
for (i in 2:6)
    curve(dinvgauss(x, par[i], 1), add = TRUE, col = col[i])

pinvgauss(qinvgauss((1:10)/10, 1.5, shape = 2), 1.5, 2)

minvgauss(1:4, 1.5, 2)

levinvgauss(c(0, 0.5, 1, 1.2, 10, Inf), 1.5, 2)



