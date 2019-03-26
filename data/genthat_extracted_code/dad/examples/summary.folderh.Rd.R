library(dad)


### Name: summary.folderh
### Title: Summarize a folderh
### Aliases: summary.folderh

### ** Examples


# First example
mtgfile <- system.file("extdata/plant1.mtg", package = "dad")
x <- read.mtg(mtgfile)
fh1 <- as.folderh(x, classes = c("P", "A", "M"))
summary(fh1)

# Second example
data(roseleaves)
roses <- roseleaves$rose
stems <- roseleaves$stem
leaves <- roseleaves$leaf
leaflets <- roseleaves$leaflet
fh2 <- folderh(roses, "rose", stems, "stem", leaves, "leaf", leaflets)
summary(fh2)



