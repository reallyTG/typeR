library(RSEIS)


### Name: comp.env
### Title: Compare Envelopes
### Aliases: comp.env
### Keywords: aplot

### ** Examples

data("GH")

temp <- cbind(GH$JSTR[[1]], GH$JSTR[[2]], GH$JSTR[[3]])

atemp <- temp[1168:1500, ]
ex  <- seq(from=0,length=length(temp[1168:1500, 1]), by=GH$dt[1])

comp.env(ex, atemp, PLOT = TRUE, stamps = c("1","2", "3") )



