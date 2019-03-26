library(dfphase1)


### Name: mshewhart
### Title: Multivariate Shewhart-type control charts
### Aliases: mshewhart mshewhart.normal.limits
### Keywords: htest multivariate statistical process monitoring statistical
###   process control distribution-free methods

### ** Examples

data(ryan)
mshewhart(ryan)
mshewhart(ryan,subset=-10)
mshewhart(ryan,subset=-c(10,20))
mshewhart(ryan,score="Signed Ranks")
mshewhart(ryan,subset=-10,score="Signed Ranks")
mshewhart(ryan,subset=-c(10,20),score="Signed Ranks")



