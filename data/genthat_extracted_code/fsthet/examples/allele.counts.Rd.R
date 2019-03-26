library(fsthet)


### Name: allele.counts
### Title: This counts the number of alleles at a locus.
### Aliases: allele.counts

### ** Examples

  #create a random sample of genotypes
  genotypes<-sample(c("0101","0102","0202"),50,replace=TRUE)
  counts<-allele.counts(genotypes)



