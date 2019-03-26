library(gap)


### Name: hap.score
### Title: Score statistics for association of traits with haplotypes
### Aliases: hap.score
### Keywords: models regression

### ** Examples

## Not run: 
##D data(hla)
##D y<-hla[,2]
##D geno<-hla[,3:8]
##D # complete data
##D hap.score(y,geno,locus.label=c("DRB","DQA","DQB"))
##D # incomplete genotype data
##D hap.score(y,geno,locus.label=c("DRB","DQA","DQB"),handle.miss=1,mloci=1)
##D unlink("assign.dat")
##D 
##D ### note the differences in p values in the following runs
##D data(aldh2)
##D # to subset the data since hap doesn't handle one allele missing
##D deleted<-c(40,239,256)
##D aldh2[deleted,]
##D aldh2<-aldh2[-deleted,]
##D y<-aldh2[,2]
##D geno<-aldh2[,3:18]
##D # only one missing locus
##D hap.score(y,geno,handle.miss=1,mloci=1,method="hap")
##D # up to seven missing loci and with 10,000 permutations
##D hap.score(y,geno,handle.miss=1,mloci=7,method="hap",n.sim=10000)
##D 
##D # hap.score takes considerably longer time and does not handle missing data
##D hap.score(y,geno,n.sim=10000)
## End(Not run)



