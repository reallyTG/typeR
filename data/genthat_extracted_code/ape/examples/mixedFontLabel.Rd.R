library(ape)


### Name: mixedFontLabel
### Title: Mixed Font Labels for Plotting
### Aliases: mixedFontLabel
### Keywords: manip

### ** Examples

tr <- read.tree(text = "((a,(b,c)),d);")
genus <- c("Gorilla", "Pan", "Homo", "Pongo")
species <- c("gorilla", "spp.", "sapiens", "pygmaeus")
geo <- c("Africa", "Africa", "World", "Asia")
tr$tip.label <- mixedFontLabel(genus, species, geo, italic = 1:2,
  parenthesis = 3)
layout(matrix(c(1, 2), 2))
plot(tr)
tr$tip.label <- mixedFontLabel(genus, species, geo, sep = c(" ", " | "),
  italic = 1:2, bold = 3)
plot(tr)
layout(1)



