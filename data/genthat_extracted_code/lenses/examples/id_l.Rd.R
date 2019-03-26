library(lenses)


### Name: id_l
### Title: The identity (trivial lens)
### Aliases: id_l
### Keywords: datasets

### ** Examples

x <- 1:10
view(x, id_l)
head(set(x, id_l, iris))



