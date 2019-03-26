library(ASMap)


### Name: breakCross
### Title: Break linkage groups of an 'qtl' cross object
### Aliases: breakCross
### Keywords: misc

### ** Examples


data(mapDH, package = "ASMap")

mapDH1 <- breakCross(mapDH, split = list("4A" = "4A.m.8"))
pull.map(mapDH1)[["4A.1"]]
pull.map(mapDH1)[["4A.2"]]

## manually choose suffix

mapDH1 <- breakCross(mapDH, split = list("4A" = "4A.m.8"),
                     suffix = list("4A" = c("4AA","4AB")))




