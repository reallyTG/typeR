library(strucchange)


### Name: breakfactor
### Title: Factor Coding of Segmentations
### Aliases: breakfactor
### Keywords: regression

### ** Examples

## Nile data with one breakpoint: the annual flows drop in 1898
## because the first Ashwan dam was built
data("Nile")
plot(Nile)

## compute breakpoints
bp.nile <- breakpoints(Nile ~ 1)

## fit and visualize segmented and unsegmented model
fm0 <- lm(Nile ~ 1)
fm1 <- lm(Nile ~ breakfactor(bp.nile, breaks = 1))

lines(fitted(fm0), col = 3)
lines(fitted(fm1), col = 4)
lines(bp.nile, breaks = 1)



