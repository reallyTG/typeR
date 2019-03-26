library(introgress)


### Name: est.h
### Title: Estimate Hybrid Index
### Aliases: est.h

### ** Examples

## Not run: 
##D ## load simulated data
##D ## markers have fixed differences, with
##D ## alleles coded as 'P1' and 'P2'
##D data(AdmixDataSim1)
##D data(LociDataSim1)
##D 
##D ## use prepare.data to produce introgress.data
##D introgress.data<-prepare.data(admix.gen=AdmixDataSim1,
##D                               loci.data=LociDataSim1,
##D                               parental1="P1", parental2="P2",
##D                               pop.id=FALSE, ind.id=FALSE,
##D                               fixed=TRUE)
##D 
##D ## estimate hybrid index
##D hi.index<-est.h(introgress.data=introgress.data,
##D                 loci.data=LociDataSim1, ind.touse=NULL, fixed=TRUE,
##D                 p1.allele="P1", p2.allele="P2")
##D 
##D write.table(hi.index, file="hindex.txt", quote=FALSE, sep=",")
## End(Not run)



