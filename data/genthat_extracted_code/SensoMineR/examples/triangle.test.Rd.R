library(SensoMineR)


### Name: triangle.test
### Title: Make a Triangle test for a set of products
### Aliases: triangle.test
### Keywords: models

### ** Examples

design = triangle.design(nbprod = 4, nbpanelist = 6, bypanelist = 3)
answer = c("X","Y","Y","X","Z","X","Y","X","Z",
    "X","X","Z","X","Y","X","Z","X","Y")
triangle.test (design, answer)  



