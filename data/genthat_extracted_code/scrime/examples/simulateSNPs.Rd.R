library(scrime)


### Name: simulateSNPs
### Title: Simulation of SNP data
### Aliases: simulateSNPs
### Keywords: datagen

### ** Examples
## Not run: 
##D # Simulate a data set containing 2000 observations (1000 cases
##D # and 1000 controls) and 50 SNPs, where one three-way and two 
##D # two-way interactions are chosen randomly to be explanatory 
##D # for the case-control status.
##D 
##D sim1 <- simulateSNPs(2000, 50, c(3, 2, 2))
##D sim1
##D 
##D # Simulate data of 1200 cases and 800 controls for 50 SNPs, 
##D # where 90% of the observations showing a randomly chosen 
##D # three-way interaction are cases, and 95% of the observations 
##D # showing a randomly chosen two-way interactions are cases.
##D 
##D sim2 <- simulateSNPs(c(1200, 800), 50, c(3, 2), 
##D    prop.explain = c(0.9, 0.95))
##D sim2
##D 
##D # Simulate a data set consisting of 1000 observations and 50 SNPs,
##D # where the minor allele frequency of each SNP is 0.25, and
##D # the interactions 
##D # ((SNP1 == 2) & (SNP2 != 0) & (SNP3 == 1))   and 
##D # ((SNP4 == 0) & (SNP5 != 2))
##D # are explanatory for 200 and 250 of the 500 cases, respectively,
##D # and for none of the 500 controls.
##D 
##D list1 <- list(c(2, 0, 1), c(0, 2))
##D list2 <- list(c(1, 0, 1), c(1, 0))
##D sim3 <- simulateSNPs(1000, 50, c(3, 2), list.ia.val = list1,
##D     list.equal = list2, vec.ia.num = c(200, 250), maf = 0.25)
##D 
## End(Not run)


