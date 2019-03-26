library(treeman)


### Name: getPrnt
### Title: Get parent
### Aliases: getPrnt

### ** Examples

library(treeman)
data(mammals)
# choosing ids from the two main branches of apes allows to find the parent for all apes
ape_id <- getPrnt(mammals, ids=c('Homo_sapiens', 'Hylobates_concolor'))



