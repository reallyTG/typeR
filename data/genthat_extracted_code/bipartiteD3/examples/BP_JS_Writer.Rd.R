library(bipartiteD3)


### Name: BP_JS_Writer
### Title: Generate JavaScript file for a bipartite network
### Aliases: BP_JS_Writer

### ** Examples


## Simple Data Set
testdata <- data.frame(higher = c("bee1","bee1","bee1","bee2","bee1","bee3"),
lower = c("plant1","plant2","plant1","plant2","plant3","plant4"),
 Meadow=c(5,9,1,2,3,7))

BP_JS_Writer(testdata,PRINT=TRUE)





