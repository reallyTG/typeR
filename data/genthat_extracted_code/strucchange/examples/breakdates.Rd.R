library(strucchange)


### Name: breakdates
### Title: Breakdates Corresponding to Breakpoints
### Aliases: breakdates breakdates.breakpoints
###   breakdates.confint.breakpoints
### Keywords: regression

### ** Examples

## Nile data with one breakpoint: the annual flows drop in 1898
## because the first Ashwan dam was built
data("Nile")
plot(Nile)

bp.nile <- breakpoints(Nile ~ 1)
summary(bp.nile)
plot(bp.nile)

## compute breakdates corresponding to the
## breakpoints of minimum BIC segmentation
breakdates(bp.nile)

## confidence intervals
ci.nile <- confint(bp.nile)
breakdates(ci.nile)
ci.nile

plot(Nile)
lines(ci.nile)



