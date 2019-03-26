library(dad)


### Name: mtgrank
### Title: Ranks of vertices in a decomposition
### Aliases: mtgrank

### ** Examples

mtgfile <- system.file("extdata/plant1.mtg", package = "dad")
xmtg <- read.mtg(mtgfile)

ymtg <- mtgrank(xmtg, "M")
print(ymtg)

mtgrank(xmtg, "M", display = TRUE)

mtgrank(xmtg, "M", parent.class = "A", display = TRUE)
mtgrank(xmtg, "M", parent.class = "A", sibling.classes = c("O", "I"), display = TRUE)
mtgrank(xmtg, "M", relative = TRUE, display = TRUE)
mtgrank(xmtg, "M", from = "origin", display = TRUE)
mtgrank(xmtg, "M", from = "end", display = TRUE)



