library(bipartiteD3)


### Name: bipartite_D3
### Title: Generate interactive bipartite networks
### Aliases: bipartite_D3

### ** Examples

## Simple Bipartite Style Data Set:
testdata <- data.frame(higher = c("bee1","bee1","bee1","bee2","bee1","bee3"),
lower = c("plant1","plant2","plant1","plant2","plant3","plant4"),
webID = c("meadow","meadow","meadow","meadow","meadow","meadow"), freq=c(5,9,1,2,3,7))
SmallTestWeb <- bipartite::frame2webs(testdata,type.out="array")


bipartite_D3(SmallTestWeb, filename = 'demo1')

## For more examples see vignette



