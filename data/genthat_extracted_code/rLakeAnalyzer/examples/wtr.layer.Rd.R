library(rLakeAnalyzer)


### Name: wtr.layer
### Title: Exploration of lake water column layers
### Aliases: wtr.layer

### ** Examples


data("latesummer")
df1 <- wtr.layer(depth=latesummer$depth, measure = latesummer$temper)
df1$mld
df1$segments

wtr.layer(data = latesummer, depth=depth, measure = temper, nseg=4)





