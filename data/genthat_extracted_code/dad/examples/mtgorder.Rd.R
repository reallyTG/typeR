library(dad)


### Name: mtgorder
### Title: Branching order of vertices
### Aliases: mtgorder

### ** Examples

mtgfile <- system.file("extdata/plant1.mtg", package = "dad")
xmtg <- read.mtg(mtgfile)

# The branching orders
ymtg <- mtgorder(xmtg)
print(ymtg)

# Add the branching orders to the 'foldermtg'
xmtg <- mtgorder(xmtg, display = TRUE)



