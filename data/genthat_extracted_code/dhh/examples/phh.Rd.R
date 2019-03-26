library(dhh)


### Name: phh
### Title: Cumulative Distribution Function (CDF) Of The Heavy-Headed
###   Distribution
### Aliases: phh

### ** Examples

phh(0)

phh(1)

phh(0.5)

phh(0.5, 0, 1, 0.1)

phh(c(0.5, 0.7))

curve(phh, from = -1, to = 2)

curve(phh(x, a=0, b=1, alpha=0.1), -1, 2)

curve(phh(x, a=0, b=10, alpha=0.1), -1, 11)

curve(phh(x, a=0, b=100, alpha=0.1), -1, 11)



