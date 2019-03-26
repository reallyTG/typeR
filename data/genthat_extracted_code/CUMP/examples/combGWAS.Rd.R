library(CUMP)


### Name: combGWAS
### Title: Combining Univariate Association Test Results of Multiple
###   Phenotypes for Detecting Pleiotropy
### Aliases: combGWAS

### ** Examples

##The following are two fake examples. Do NOT run. 
##Please refer to example.pdf for details.
##no change of beta signs before combining
##combGWAS(project="mv",traitlist=c("phen1","phne2"),
## traitfile=c("Phen1GWAS.csv", "Phen2GWAS.csv"), comb_method=c("z","chisq"), 
## betasign=c(1,1), snpid="SNPID", beta="beta", SE="SE", 
## coded_all="coded_all"", AF_coded_all=" AF_coded_all ", pvalue="pval") 

##change of  beta signs before combining: the beta sign for the 2nd phenotype reversed
##combGWAS(project="mv",traitlist=c("phen1","phne2"),
## traitfile=c("Phen1GWAS.csv", "Phen2GWAS.csv"), comb_method=c("z","chisq"),
## betasign=c(1,-1), snpid="SNPID", beta="beta", SE="SE", 
## coded_all="coded_all ", AF_coded_all=" AF_coded_all ", pvalue="pval") 



