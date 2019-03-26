library(fclust)


### Name: synt.data2
### Title: Synthetic data
### Aliases: synt.data2
### Keywords: datasets

### ** Examples

data(synt.data2)
plot(synt.data2)

## Gustafson and Kessel-like fuzzy k-means
syntFKM.gk=FKM.gk(synt.data2, k = 3, RS = 1, seed = 123)
## Gustafson, Kessel and Babuska-like fuzzy k-means
syntFKM.gkb=FKM.gkb(synt.data2, k = 3, RS = 1, seed = 123)




