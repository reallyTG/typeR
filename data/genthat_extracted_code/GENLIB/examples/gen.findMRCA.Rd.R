library(GENLIB)


### Name: gen.findMRCA
### Title: Finding most recent common ancestors, MRCAs
### Aliases: gen.findMRCA
### Keywords: manip

### ** Examples

data(geneaJi)
genJi<-gen.genealogy(geneaJi)
gen.findMRCA(genJi, individuals=c(1,29), NbProcess = 1)

## No test: 
 ## Not run: For a more complex example:
 data(genea140) 
 gen140<-gen.genealogy(genea140) 
 all_commonFounders<-gen.findFounders(gen140, individuals=c(409033,408728), NbProcess = 1)
 ## Not run: 127 founders common to #409033 and #408728
 length(all_commonFounders)
 ## Not run: 22 most recent common ancestors for #409033 and #408728
 MRCA_2ind<-gen.findMRCA(gen140, individuals=c(409033,408728), NbProcess = 1)
## End(No test)



