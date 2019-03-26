library(ggfortify)


### Name: autoplot.breakpoints
### Title: Autoplot 'strucchange::breakpoints'
### Aliases: autoplot.breakpoints autoplot.breakpointsfull

### ** Examples

library(strucchange)
bp.nile <- breakpoints(Nile ~ 1)
autoplot(bp.nile)
autoplot(bp.nile, is.date = TRUE)
autoplot(breakpoints(bp.nile, breaks = 2), data = Nile)



