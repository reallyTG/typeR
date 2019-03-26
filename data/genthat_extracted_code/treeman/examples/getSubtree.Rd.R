library(treeman)


### Name: getSubtree
### Title: Get subtree
### Aliases: getSubtree

### ** Examples

library(treeman)
data(mammals)
# get tree of apes
ape_id <- getPrnt(mammals, ids=c('Homo_sapiens', 'Hylobates_concolor'))
apes <- getSubtree(mammals, id=ape_id)
summary(apes)



