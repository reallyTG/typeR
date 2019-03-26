library(lfstat)


### Name: dmcurve
### Title: Double Mass Curve
### Aliases: dmcurve

### ** Examples

data(ngaruroro)
n1 <- subset(ngaruroro, year %in% 1985:1989)
n2 <- subset(ngaruroro, year %in% 1990:1995)
dmcurve(n1,n2, namex = "'Ngaruroro 1985 - 1989'", namey = "'Ngaruroro 1990
- 1995'")



