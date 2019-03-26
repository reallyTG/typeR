library(snplist)


### Name: setGeneTable
### Title: setGeneTable
### Aliases: setGeneTable
### Keywords: database

### ** Examples

    geneInfo <- cbind(c('BRCA1','BRCA2'),c(17,13),c(41196312,32889611),c(41277500,32973805))
    colnames(geneInfo) <- c('gene','chr','start','end')
    setGeneTable(as.data.frame(geneInfo))



