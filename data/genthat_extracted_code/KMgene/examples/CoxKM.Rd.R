library(KMgene)


### Name: CoxKM
### Title: KM for Survival Traits in GWAS Data (calculate p-value)
### Aliases: CoxKM

### ** Examples

##########################################################
### Examples for Survival Traits in GWAS Data using KM ###
##########################################################
data("CoxKM_data")
library(survival)
cov <- as.matrix(pheno1[,2:3])
p<-vector()
for (i in 1:2) {
  Gene <- unique(SNPInfo$gene)[i]
  choose <- SNPInfo$gene == Gene
  geno <- Z1[,choose]
  cohort1 <- prepCoxKM(Z=Z1, Surv(time, status)~strata(sex)+bmi,
  SNPInfo=SNPInfo[choose,], data=pheno1)
  p[i] <- CoxKM(cohort1, SNPInfo=SNPInfo[choose,])
}



