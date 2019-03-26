library(treeman)


### Name: setTxnyms
### Title: Set the txnym slots in a tree
### Aliases: setTxnyms

### ** Examples

library(treeman)
data(mammals)
# let's change the txnym for humans
# what's its summary before we change anything?
summary(mammals[['Homo_sapiens']])
# now let's add Hominini
new_txnym <- list('Homo_sapiens'=c('Hominini', 'Homo'))
mammals <- setTxnyms(mammals, new_txnym)
summary(mammals[['Homo_sapiens']])



