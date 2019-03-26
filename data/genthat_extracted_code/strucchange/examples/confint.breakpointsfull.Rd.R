library(strucchange)


### Name: confint.breakpointsfull
### Title: Confidence Intervals for Breakpoints
### Aliases: confint.breakpointsfull lines.confint.breakpoints
###   print.confint.breakpoints
### Keywords: regression

### ** Examples

## Nile data with one breakpoint: the annual flows drop in 1898
## because the first Ashwan dam was built
data("Nile")
plot(Nile)

## dating breaks
bp.nile <- breakpoints(Nile ~ 1)
ci.nile <- confint(bp.nile, breaks = 1)
lines(ci.nile)



