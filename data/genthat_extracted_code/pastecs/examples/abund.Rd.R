library(pastecs)


### Name: abund
### Title: Sort variables by abundance
### Aliases: abund extract.abund identify.abund lines.abund plot.abund
###   print.abund print.summary.abund summary.abund
### Keywords: multivariate

### ** Examples

data(bnr)
bnr.abd <- abund(bnr)
summary(bnr.abd)
plot(bnr.abd, dpos=c(105, 100))
bnr.abd$n <- 26
# To identify a point on the graph, use: bnr.abd$n <- identify(bnr.abd)
lines(bnr.abd)
bnr2 <- extract(bnr.abd)
names(bnr2)



