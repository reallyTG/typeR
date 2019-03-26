library(SNPassoc)


### Name: intervals
### Title: Print ORs and 95% confidence intervals for an object of class
###   'haplo.glm'
### Aliases: intervals intervals.haplo.glm print.intervals
###   summary.haplo.glm
### Keywords: utilities

### ** Examples

# Not Run
# data(SNPs)
# tag.SNPs<-c("snp100019","snp10001","snp100029")
# geno<-make.geno(SNPs,tag.SNPs)

# mod<-haplo.glm(casco~geno,data=SNPs, 
#      family=binomial,
#	locus.label=tag.SNPs,
#	allele.lev=attributes(geno)$unique.alleles,
#	control = haplo.glm.control(haplo.freq.min=0.05))

# intervals(mod)
# summary(mod)




