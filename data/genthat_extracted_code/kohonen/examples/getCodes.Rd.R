library(kohonen)


### Name: getCodes
### Title: Extract codebook vectors from a kohonen object
### Aliases: getCodes
### Keywords: manip

### ** Examples

data(wines)
set.seed(7)
som.wines <- som(scale(wines), grid = somgrid(5, 5, "hexagonal"))
dim(getCodes(som.wines))



