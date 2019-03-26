library(Benchmarking)


### Name: eladder
### Title: Efficiency ladder for a single firm
### Aliases: eladder eladder.plot
### Keywords: models efficiency plot

### ** Examples

data(charnes1981)
x <- with(charnes1981, cbind(x1,x2,x3,x4,x5))
y <- with(charnes1981, cbind(y1,y2,y3))

# Choose the firm for analysis, we choose 'Tacoma'
n <- which(charnes1981$name=="Tacoma")[1]

el <- eladder(n, x, y, RTS="crs")
eladder.plot(el$eff, el$peer)

# Restrict to 20 most influential peers for 'Tacoma' and use names
# instead of number
eladder.plot(el$eff[1:20], charnes1981$name[el$peer][1:20])

# Truncate the names of the peers and put a title on top
eladder.plot(el$eff[1:20], charnes1981$name[el$peer][1:20], TRIM=5)
title("Eladder for Tacoma")



