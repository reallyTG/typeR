library(treeman)


### Name: rmClade
### Title: Remove a clade from a tree
### Aliases: rmClade

### ** Examples

library(treeman)
t1 <- randTree(100)
# remove a clade
t2 <- rmClade(t1, 'n2')
summary(t1)
summary(t2)



