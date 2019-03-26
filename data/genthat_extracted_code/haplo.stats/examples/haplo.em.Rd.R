library(haplo.stats)


### Name: haplo.em
### Title: EM Computation of Haplotype Probabilities, with Progressive
###   Insertion of Loci
### Aliases: haplo.em

### ** Examples

data(hla.demo)
attach(hla.demo)
geno <- hla.demo[,c(17,18,21:24)]
label <-c("DQB","DRB","B")
keep <- !apply(is.na(geno) | geno==0, 1, any)

save.em.keep <- haplo.em(geno=geno[keep,], locus.label=label)

# warning: output will not exactly match

print.haplo.em(save.em.keep)



