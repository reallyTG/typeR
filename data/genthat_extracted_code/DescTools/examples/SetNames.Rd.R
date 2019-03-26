library(DescTools)


### Name: SetNames
### Title: Set the Names in an Object
### Aliases: SetNames
### Keywords: list

### ** Examples

tab <- table(d.pizza$driver, d.pizza$wine_delivered)
SetNames(BinomCI(tab[,1], rowSums(tab)), rownames=rownames(tab))



