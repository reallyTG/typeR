library(gap)


### Name: hap
### Title: Haplotype reconstruction
### Aliases: hap
### Keywords: models

### ** Examples

## Not run: 
##D # 4 SNP example, to generate hap.out and assign.out alone
##D data(fsnps)
##D hap(id=fsnps[,1],data=fsnps[,3:10],nloci=4)
##D dir()
##D file.show("hap.out")
##D file.show("assign.out")
##D 
##D # to generate results of imputations
##D control <- hap.control(ss=1,mi=5,hapfile="h",assignfile="a")
##D hap(id=fsnps[,1],data=fsnps[,3:10],nloci=4,control=control)
##D dir()
## End(Not run)



