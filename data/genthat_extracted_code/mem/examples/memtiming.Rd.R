library(mem)


### Name: memtiming
### Title: Influenza Epidemic Timing
### Aliases: memtiming summary.epidemic,plot.epidemic,print.epidemic
### Keywords: influenza

### ** Examples

# Castilla y Leon Influenza Rates data
data(flucyl)
# Finds the timing of the first season: 2001/2002
tim<-memtiming(flucyl[1])
print(tim)
summary(tim)
plot(tim)




