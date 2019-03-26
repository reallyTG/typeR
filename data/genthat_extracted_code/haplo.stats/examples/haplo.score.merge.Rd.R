library(haplo.stats)


### Name: haplo.score.merge
### Title: Merge haplo.score And haplo.group Objects
### Aliases: haplo.score.merge
### Keywords: scores

### ** Examples

  data(hla.demo)
  geno <- as.matrix(hla.demo[,c(17,18,21:24)])
  keep <- !apply(is.na(geno) | geno==0, 1, any)
  hla.demo <- hla.demo[keep,]
  geno <- geno[keep,]
  attach(hla.demo)
  y.ord <- as.numeric(resp.cat)
  y.bin <-ifelse(y.ord==1,1,0)
  
  group.bin <- haplo.group(y.bin, geno, miss.val=0)
  score.bin <- haplo.score(y.bin, geno, trait.type="binomial")
  score.merged <- haplo.score.merge(score.bin, group.bin)

  print(score.merged)



