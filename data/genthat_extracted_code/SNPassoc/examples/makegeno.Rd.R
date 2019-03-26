library(SNPassoc)


### Name: make.geno
### Title: Create a group of locus objects from some SNPs, assign to
###   'model.matrix' class.
### Aliases: make.geno
### Keywords: utilities

### ** Examples

## Not run:
data(SNPs)
# first, we create an object of class 'setupSNP'
datSNP<-setupSNP(SNPs,6:40,sep="")
geno<-make.geno(datSNP,c("snp10001","snp10002","snp10003"))
## End(Not run)





