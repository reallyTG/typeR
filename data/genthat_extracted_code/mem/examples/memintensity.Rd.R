library(mem)


### Name: memintensity
### Title: Thresholds for influenza intensity
### Aliases: memintensity
### Keywords: influenza

### ** Examples

# Castilla y Leon Influenza Rates data
data(flucyl)
# mem model
flucyl.mem<-memmodel(flucyl)
# Calculates intensity thresholds
intensity<-memintensity(flucyl.mem)
intensity




