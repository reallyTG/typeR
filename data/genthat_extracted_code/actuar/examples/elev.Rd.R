library(actuar)


### Name: elev
### Title: Empirical Limited Expected Value
### Aliases: elev elev.default elev.grouped.data print.elev summary.elev
###   knots.elev plot.elev
### Keywords: dplot hplot

### ** Examples

data(gdental)
lev <- elev(gdental)
lev
summary(lev)
knots(lev)            # the group boundaries

lev(knots(lev))       # empirical lev at boundaries
lev(c(80, 200, 2000)) # and at other limits

plot(lev, type = "o", pch = 16)



