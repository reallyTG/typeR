library(haplo.stats)


### Name: summary.haplo.em
### Title: Summarize contents of a haplo.em object
### Aliases: summary.haplo.em

### ** Examples

data(hla.demo)
geno <- hla.demo[,c(17,18,21:24)]
label <-c("DQB","DRB","B")
keep <- !apply(is.na(geno) | geno==0, 1, any)

save.em.keep <- haplo.em(geno=geno[keep,], locus.label=label)
save.df <- summary(save.em.keep)
save.df[1:10,]



