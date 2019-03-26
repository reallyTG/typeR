library(wrapr)


### Name: Collector
### Title: Build a collector that can capture all pipe stages to the right.
### Aliases: Collector

### ** Examples


phase <- 0.1
Collector() %.>% sin(.) %.>% cos(. + .(phase))




