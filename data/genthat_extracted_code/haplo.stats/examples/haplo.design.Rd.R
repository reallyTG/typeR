library(haplo.stats)


### Name: haplo.design
### Title: Build a design matrix for haplotypes
### Aliases: haplo.design
### Keywords: models

### ** Examples


 ###------------------------------------------------
 ### See the user manual for more complete examples
 ###------------------------------------------------

 data(hla.demo)
 attach(hla.demo)

 geno <- hla.demo[,c(17,18,21:24)]
 label <-c("DQB","DRB","B")

 keep <- !apply(is.na(geno) | geno==0, 1, any)

 save.em.keep <- haplo.em(geno=geno[keep,], locus.label=label)

 save.df <- haplo.design(save.em.keep, min.count=10)
 dim(save.df)

 names(save.df)
 save.df[1:10,]





