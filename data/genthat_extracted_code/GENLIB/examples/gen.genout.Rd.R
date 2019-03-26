library(GENLIB)


### Name: gen.genout
### Title: Create pedigree data
### Aliases: gen.genout
### Keywords: manip

### ** Examples

data(geneaJi) 
## Not run: original data is a data.frame
geneaJi[1:12,]

genJi<-gen.genealogy(geneaJi) 
## Not run: as a genealogy object
genJi

## Not run: Genealogy as a data.frame
genJi_df<-gen.genout(genJi)
genJi_df[1:12,]

## Not run: Maternal lineage 
genJi_MaLi<-gen.lineages(geneaJi, maternal = TRUE) 
## Not run: Maternal lineage as a data.frame
genJi_MaLi_df<-gen.genout(genJi_MaLi)
genJi_MaLi_df



