### R code from vignette source 'mlPhaser.Rnw'

###################################################
### code chunk number 1: Install mlPhaser (eval = FALSE)
###################################################
## install.packages("mlPhaser_0.01.zip", repos=NULL)


###################################################
### code chunk number 2: Load library
###################################################
library(mlPhaser)


###################################################
### code chunk number 3: Load library
###################################################
haplotypes <- data.frame(	A= c("a","b","c","a","b","c","b"),
				B= c("a","b","c","b","c","a","a"),
				C= c("a","b","c","b","c","a","a") )
rownames(haplotypes) <- apply(haplotypes, 1, paste,sep="" , collapse="")
haplotypes


###################################################
### code chunk number 4: HaplFreqs
###################################################
haploFreqs <- c(0.4, 0.3, 0.15, 0.07,0.05, 0.02, 0.01)
names(haploFreqs) <- rownames(haplotypes)
haploFreqs


###################################################
### code chunk number 5: thisGenotype
###################################################
thisGenotype <- data.frame(A.1="a", A.2="b", B.1="a", B.2="b",C.1="a", C.2="b")
thisGenotype


###################################################
### code chunk number 6: simGenos
###################################################
my.genotypes <- simGenoFromHaplo(haploTable=haplotypes, haploFreqs=haploFreqs , 
		n=20, ploidy=2)
head(my.genotypes)


###################################################
### code chunk number 7: getValid
###################################################
my.valid.groups <- getValidHaploGroups(thisGenotype,haplotypes)
my.valid.groups


###################################################
### code chunk number 8: phaseReport
###################################################
phaseReport(thisGenotype,haplotypes)
phaseReport(my.genotypes,haplotypes) 	# a full table of genotypes


###################################################
### code chunk number 9: phaseReportWithFreqs
###################################################
# use haplotype frequencies to rank candidate haplotype groups.
phaseReport(thisGenotype,haplotypes, haploFreqs)
# return only the best haplotype group for each genotype. 
# outFormat="all" is the default
phaseReport(thisGenotype,haplotypes, haploFreqs, outFormat="top") 
# get phase report on all genotypes
phaseReport(my.genotypes,haplotypes, haploFreqs, outFormat="all")
# Same but only return the top result for each genotype
phaseReport(my.genotypes,haplotypes, haploFreqs, outFormat="top")


###################################################
### code chunk number 10: Session info
###################################################
sessionInfo()


