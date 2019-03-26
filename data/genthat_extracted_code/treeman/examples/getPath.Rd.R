library(treeman)


### Name: getPath
### Title: Get path between nodes
### Aliases: getPath

### ** Examples

library(treeman)
data(mammals)
# what's the phylogenetic distance from humans to gorillas?
ape_id <- getPrnt(mammals, ids=c('Homo_sapiens', 'Hylobates_concolor'))
pth <- getPath(mammals, from='Homo_sapiens', to='Gorilla_gorilla')
sum(getNdsSlt(mammals, ids=pth, slt_nm='spn'))



