library(klaR)


### Name: classscatter
### Title: Classification scatterplot matrix
### Aliases: classscatter
### Keywords: dplot classif

### ** Examples

data(B3)
library(MASS)
classscatter(PHASEN ~ BSP91JW + EWAJW + LSTKJW, 
    data = B3, method = "lda")



