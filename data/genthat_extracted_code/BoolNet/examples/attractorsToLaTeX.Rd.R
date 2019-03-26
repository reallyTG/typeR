library(BoolNet)


### Name: attractorsToLaTeX
### Title: Create LaTeX state table of attractors
### Aliases: attractorsToLaTeX
### Keywords: LaTeX Boolean network attractor cycle basin transition state
###   graph

### ** Examples

# load example data
data(cellcycle)

# get attractors
attractors <- getAttractors(cellcycle)

# output LaTeX document
attractorsToLaTeX(attractors, file="attractors.tex")



