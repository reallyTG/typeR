library(bcRep)


### Name: sequences.geneComb
### Title: Gene/gene combinations
### Aliases: sequences.geneComb plotGeneComb

### ** Examples

data(summarytab)
VDcomb.tab<-sequences.geneComb(family1 = summarytab$V_GENE_and_allele, 
     family2 = summarytab$D_GENE_and_allele, level = "subgroup", abundance = "relative")
     
plotGeneComb(geneComb.tab=VDcomb.tab, withNA=FALSE)



