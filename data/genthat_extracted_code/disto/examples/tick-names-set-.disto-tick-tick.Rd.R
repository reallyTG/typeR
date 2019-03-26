library(disto)


### Name: `names<-.disto``
### Title: Set names/labels
### Aliases: `names<-.disto`` names<-.disto

### ** Examples

temp <- stats::dist(iris[,1:4])
dio <- disto(objectname = "temp")
dio
names(dio) <- paste0("a", 1:150)



