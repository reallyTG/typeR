library(ASMap)


### Name: mergeCross
### Title: Merge linkage groups of an 'qtl' cross object
### Aliases: mergeCross
### Keywords: misc

### ** Examples


data(mapDH, package = "ASMap")

mapDH1 <- breakCross(mapDH, split = list("4A" = "4A.m.8"))
pull.map(mapDH1)[["4A.1"]]
pull.map(mapDH1)[["4A.2"]]

mapDH2 <- mergeCross(mapDH1, merge = list("4A" = c("4A.1","4A.2")))
pull.map(mapDH2)[["4A"]]



