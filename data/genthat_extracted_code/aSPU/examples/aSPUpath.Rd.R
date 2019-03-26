library(aSPU)


### Name: aSPUpath
### Title: Pathway based Sum of Powered Score tests (SPUpath) and adaptive
###   SPUpath (aSPUpath) test for single trait - pathway association.
### Aliases: aSPUpath

### ** Examples


## Not run: 
##D dat1<-simPathAR1Snp(nGenes=20, nGenes1=5, nSNPlim=c(1, 20),
##D 	       nSNP0=1, LOR=.2, n=100, MAFlim=c(0.05, 0.4), p0=0.05 ) 
## End(Not run)
## Don't show: 
dat1<-simPathAR1Snp(nGenes=20, nGenes1=5, nSNPlim=c(1, 20),
            nSNP0=1, LOR=.2, n=40, MAFlim=c(0.05, 0.4), p0=0.05 ) 
## End(Don't show)

# p-values of SPUpath and aSPUpath tests.
## Not run: 
##D p.pathaspu<- aSPUpath(dat1$Y, dat1$X, snp.info = dat1$snp.info,
##D          gene.info = dat1$gene.info,
##D          model = "binomial", pow=1:8, pow2=c(1, 2, 4, 8), n.perm=1000) 
## End(Not run)
## Don't show: 
p.pathaspu<- aSPUpath(dat1$Y, dat1$X, snp.info = dat1$snp.info,
         gene.info = dat1$gene.info,
         model = "binomial", pow=1:8, pow2=c(1, 2, 4, 8), n.perm=30) 
## End(Don't show)
p.pathaspu
## pow = 1:8 and pow2 = 1,2,4,8
## So, there are 8*4 = 32 SPUpath p-values.
## SPUpathi,j corresponds pow = i , pow2 = j
## The last element, aSPUpath gives aSPUpath p-value.




