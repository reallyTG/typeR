library(SixSigma)


### Name: ss.data.doe1
### Title: Pizza dough example data
### Aliases: ss.data.doe1
### Keywords: data doe

### ** Examples

data(ss.data.doe1)
summary(ss.data.doe1)
lattice::bwplot(score ~ flour | salt + bakPow , 
 data = ss.data.doe1, 
 xlab = "Flour", 
 strip = function(..., style) lattice::strip.default(..., strip.names=c(TRUE,TRUE)))




