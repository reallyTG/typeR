library(introgress)


### Name: genomic.clines
### Title: Genomic Clines
### Aliases: genomic.clines

### ** Examples

## Not run: 
##D ## Example 1, genomic clines analysis without significance testing, or
##D ## with significance testing on a subset of the data
##D 
##D ## load simulated data
##D ## markers do not have fixed differences
##D data(AdmixDataSim2)
##D data(LociDataSim2)
##D data(p1DataSim2)
##D data(p2DataSim2)
##D 
##D ## use prepare.data to produce introgress.data
##D introgress.data1<-prepare.data(admix.gen=AdmixDataSim2,
##D                                loci.data=LociDataSim2,
##D                                parental1=p1DataSim2, parental2=p2DataSim2,
##D                                pop.id=TRUE, ind.id=TRUE, fixed=FALSE)
##D 
##D ## estimate hybrid index
##D hi.index1<-est.h(introgress.data=introgress.data1,loci.data=LociDataSim2,
##D                  fixed=FALSE)
##D 
##D ## estimate genomic clines without significance testing
##D clines.out1<-genomic.clines(introgress.data=introgress.data1,
##D                             hi.index=hi.index1,
##D                             loci.data=LociDataSim2, sig.test=FALSE)
##D 
##D ## for a subset of loci, estimate genomic clines with significance testing
##D clines.out1b<-genomic.clines(introgress.data=introgress.data1,
##D                              hi.index=hi.index1,
##D                              loci.data=LociDataSim2, sig.test=TRUE,
##D                              method="parametric", loci.touse=1:10)
##D 
##D ###############################################################
##D ## Example 2, genomic clines analysis with significance testing
##D 
##D ## load simulated data
##D ## markers have fixed differences, with
##D ## alleles coded as 'P1' and 'P2'
##D data(AdmixDataSim1)
##D data(LociDataSim1)
##D 
##D ## use prepare.data to produce introgress.data
##D introgress.data2<-prepare.data(admix.gen=AdmixDataSim1,
##D                                loci.data=LociDataSim1,
##D                                parental1="P1", parental2="P2",
##D                                pop.id=FALSE, ind.id=FALSE, fixed=TRUE)
##D 
##D ## estimate hybrid index
##D hi.index2<-est.h(introgress.data=introgress.data2,
##D                 loci.data=LociDataSim1, fixed=TRUE, p1.allele="P1",
##D                 p2.allele="P2")
##D 
##D ## estimate genomic clines and perform significance testing
##D ## note the small number of replicates (chosen only to speed example)
##D clines.out2<-genomic.clines(introgress.data=introgress.data2,
##D                             hi.index=hi.index2, loci.data=LociDataSim1,
##D                             sig.test=TRUE, method="permutation",
##D                             classification=TRUE,n.reps=100)
##D 
##D write.table(clines.out2$Summary.data, file="clines.txt",
##D             quote=FALSE, sep=",")
## End(Not run)



