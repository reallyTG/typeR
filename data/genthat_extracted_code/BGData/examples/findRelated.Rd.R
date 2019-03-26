library(BGData)


### Name: findRelated
### Title: Find related individuals in a relationship matrix.
### Aliases: findRelated findRelated.matrix findRelated.symDMatrix

### ** Examples

# Load example data
bg <- BGData:::loadExample()

G <- getG(bg@geno)
findRelated(G)



