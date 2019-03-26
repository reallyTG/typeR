library(fsthet)


### Name: calc.exp.het
### Title: This calculates expected heterozygosities.
### Aliases: calc.exp.het

### ** Examples

  #create a random sample of genotypes
  genotypes<-sample(c("0101","0102","0202"),50,replace=TRUE)
  af<-calc.allele.freq(genotypes)
  hs<-calc.exp.het(af)



