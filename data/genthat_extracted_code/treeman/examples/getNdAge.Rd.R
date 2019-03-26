library(treeman)


### Name: getNdAge
### Title: Get age
### Aliases: getNdAge

### ** Examples

library(treeman)
data(mammals)
# when did apes emerge?
# get parent id for all apes
prnt_id <- getPrnt(mammals, ids=c('Homo_sapiens', 'Hylobates_concolor'))
# mammal_age <- getAge(mammals)  # ~166.2, needs to be performed when tree is not up-to-date
getNdAge(mammals, id=prnt_id, tree_age=166.2)



