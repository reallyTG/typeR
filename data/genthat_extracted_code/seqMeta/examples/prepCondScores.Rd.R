library(seqMeta)


### Name: prepCondScores
### Title: Run SKAT on data from a single cohort, conditional on specified
###   SNP effects
### Aliases: prepCondScores

### ** Examples

###load example data for two studies:
### see ?seqMetaExample	
data(seqMetaExample)

#specify adjustment variables
adjustments <- SNPInfo[c(1:3, 20,100), ]
adjustments

####run on each study:
cohort1.adj <- prepCondScores(Z=Z1, y~sex+bmi, SNPInfo = SNPInfo, 
                adjustments=adjustments, data =pheno1)
cohort2.adj <- prepCondScores(Z=Z2, y~sex+bmi, SNPInfo = SNPInfo, 
                adjustments=adjustments, kins=kins, data=pheno2)

SNPInfo.sub <- subset(SNPInfo, (SNPInfo$gene %in% adjustments$gene) & 
                                !(SNPInfo$Name %in% adjustments$Name) )

#skat
out.skat <- skatMeta(cohort1.adj,cohort2.adj, SNPInfo = SNPInfo.sub)
head(out.skat)

##T1 test
out.t1 <- burdenMeta(cohort1.adj,cohort2.adj, SNPInfo = SNPInfo.sub, mafRange = c(0,0.01))
head(out.t1)

##single snp tests:
out.ss <- singlesnpMeta(cohort1.adj,cohort2.adj, SNPInfo = SNPInfo.sub)
head(out.ss)




