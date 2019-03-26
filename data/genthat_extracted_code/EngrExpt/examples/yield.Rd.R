library(EngrExpt)


### Name: yield
### Title: Yield of a chemical process
### Aliases: yield
### Keywords: datasets

### ** Examples

str(yield)
xyplot(yield ~ temp|cut(pH, seq(6.25,6.85,len = 4), ordered = TRUE),
       yield, type = c("g","p","r"),
       xlab = "Temperature of the slurry (degrees C)",
       ylab = "Yield (tons)")



