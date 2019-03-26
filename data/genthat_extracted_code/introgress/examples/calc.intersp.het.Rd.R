library(introgress)


### Name: calc.intersp.het
### Title: Calculate Interspecific Heterozygosity
### Aliases: calc.intersp.het

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
##D ## Estimate inter-specific heterozygosity
##D int.het<-calc.intersp.het(introgress.data=introgress.data)
## End(Not run)



