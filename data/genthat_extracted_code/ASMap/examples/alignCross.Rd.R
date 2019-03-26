library(ASMap)


### Name: alignCross
### Title: Graphical linkage group identity and alignment.
### Aliases: alignCross
### Keywords: misc

### ** Examples


data(mapDH, package = "ASMap")

chrl <- sample(c(TRUE,FALSE), 23, replace = TRUE)
mapDH1 <- subset(mapDH, chr = chrl)
alignCross(mapDH, maps = list(DH = mapDH1), layout = c(3,5), col = 1:7)




