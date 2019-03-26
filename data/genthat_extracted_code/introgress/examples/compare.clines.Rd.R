library(introgress)


### Name: compare.clines
### Title: Compare Clines
### Aliases: compare.clines

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
##D                                loci.data=LociDataSim1,
##D                                parental1="P1", parental2="P2",
##D                                pop.id=FALSE, ind.id=FALSE, fixed=TRUE)
##D 
##D ## estimate hybrid index
##D hi.index<-est.h(introgress.data=introgress.data,
##D                 loci.data=LociDataSim1, p1.allele="P1",
##D                 p2.allele="P2")
##D 
##D ## random sampling to divide data into two sets of 100 individuals,
##D ## this creates two admixed populations (hybrid zones)
##D numbs<-sample(1:200,200,replace=FALSE)
##D sam1<-numbs[1:100]
##D sam2<-numbs[101:200]
##D 
##D ## estimate genomic clines for each data set,
##D ## significance testing is not conducted
##D clines.out1<-genomic.clines(introgress.data=introgress.data,
##D                             hi.index=hi.index,loci.data=LociDataSim1,
##D                             sig.test=FALSE, ind.touse=sam1)
##D 
##D clines.out2<-genomic.clines(introgress.data=introgress.data,
##D                             hi.index=hi.index,loci.data=LociDataSim1,
##D                             sig.test=FALSE, ind.touse=sam2)
##D 
##D ## compare clines between data sets, with significance testing
##D comp.out<-compare.clines(clines.out1,clines.out2,sig.test=TRUE,
##D                          n.reps=1000)
##D 
##D write.table(comp.out, file="compareClines.txt",
##D             quote=FALSE, sep=",")
## End(Not run)



