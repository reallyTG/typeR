library(PIGE)


### Name: data.to.PIGE
### Title: Generate data for Gene- and Pathway-environment interaction
### Aliases: data.to.PIGE

### ** Examples

data(data.pathway)
data(data.pige)
data(list.gene.snp)
#Example: one pathway
res1 <-data.to.PIGE(data=data.pige,data.pathway=data.pathway,
list.gene.snp=list.gene.snp,choice.pathway=c(2))
#Example: two pathways
res <-data.to.PIGE(data=data.pige,data.pathway=data.pathway
,list.gene.snp=list.gene.snp,choice.pathway=c(1,2))



