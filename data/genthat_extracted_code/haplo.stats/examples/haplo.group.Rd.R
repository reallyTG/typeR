library(haplo.stats)


### Name: haplo.group
### Title: Frequencies for Haplotypes by Grouping Variable
### Aliases: haplo.group

### ** Examples

  data(hla.demo)
  geno <- as.matrix(hla.demo[,c(17,18,21:24)])

# remove any subjects with missing alleles for faster examples, 
# but you may keep them in practice
  keep <- !apply(is.na(geno) | geno==0, 1, any)
  hla.demo <- hla.demo[keep,]
  geno <- geno[keep,]
  attach(hla.demo)
  
  y.ord <- as.numeric(resp.cat)
  y.bin <-ifelse(y.ord==1,1,0)
  group.bin <- haplo.group(y.bin, geno, miss.val=0)
  print.haplo.group(group.bin)



