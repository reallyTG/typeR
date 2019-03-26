library(seriation)


### Name: Zoo
### Title: Zoo Data Set
### Aliases: Zoo
### Keywords: datasets

### ** Examples

data("Zoo")
x <- scale(Zoo[, -17])


d <- dist(x)
pimage(d)

order <- seriate(d, method = "tsp")
pimage(d, order)



