library(mem)


### Name: memtrend
### Title: Methods for influenza trend calculation
### Aliases: memtrend
### Keywords: influenza

### ** Examples

# Castilla y Leon Influenza Rates data
data(flucyl)
# mem model
flucyl.mem<-memmodel(flucyl)
# Calculates trend thresholds
trend<-memtrend(flucyl.mem)
trend




