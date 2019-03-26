library(asbio)


### Name: suess
### Title: del14C in the atmosphere from 1700-1950
### Aliases: suess
### Keywords: datasets

### ** Examples

data(suess)
with(suess, plot(Year, del14C, col = Source, pch = as.numeric(Source)))
with(suess, legend("topright", legend = levels(Source), col = 1:4, pch = 1:4))
lines(lowess(suess$Year, suess$del14C, f = .25), lwd = 2)



