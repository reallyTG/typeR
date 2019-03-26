library(reldist)


### Name: precipitation
### Title: Annual Precipitation in US Cities
### Aliases: precipitation
### Keywords: datasets

### ** Examples

require(graphics)
data(precipitation)
dotchart(precipitation[order(precipitation)], main="precipitation data")
title(sub = "Average annual precipitation (in.)")



