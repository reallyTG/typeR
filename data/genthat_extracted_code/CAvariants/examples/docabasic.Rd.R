library(CAvariants)


### Name: docabasic
### Title: Doubly, or two-way, ordered correspondence analysis: for two
###   ordered variables
### Aliases: docabasic
### Keywords: ~multivariate

### ** Examples

data(asbestos)
mi <- c(1,2,3,4) #natural scores for rows
mj <- c(4.5,14.5,24.5,34.5,44.5) #midpoints for columns
docabasic(asbestos, mi, mj)



