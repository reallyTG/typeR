library(introgress)


### Name: mk.image
### Title: Make Image
### Aliases: mk.image

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
##D                               parental1="P1", parental2="P2", pop.id=FALSE, 
##D                               ind.id=FALSE, fixed=TRUE)
##D 
##D ## estimate hybrid index
##D hi.index<-est.h(introgress.data=introgress.data,
##D                 loci.data=LociDataSim1, fixed=TRUE, p1.allele="P1",
##D                 p2.allele="P2")
##D 
##D ## produce image plot of marker ancestry
##D mk.image(introgress.data=introgress.data, loci.data=LociDataSim1,
##D          marker.order=NULL, hi.index=hi.index, ind.touse=NULL,
##D          loci.touse=NULL, ylab.image="Individuals", main.image="",
##D 	 xlab.h="population 2 ancestry", col.image=NULL,
##D 	 pdf=TRUE, out.file="image.pdf")
## End(Not run)



