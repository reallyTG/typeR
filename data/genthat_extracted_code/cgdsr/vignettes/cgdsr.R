### R code from vignette source 'cgdsr.Rnw'

###################################################
### code chunk number 1: cgdsr.Rnw:71-74
###################################################
library(cgdsr)
# Create CGDS object
mycgds = CGDS("http://www.cbioportal.org/")


###################################################
### code chunk number 2: cgdsr.Rnw:83-85
###################################################
# Test the CGDS endpoint URL using a few simple API tests
test(mycgds) 


###################################################
### code chunk number 3: cgdsr.Rnw:93-95
###################################################
# Get list of cancer studies at server
getCancerStudies(mycgds)[,c(1,2)]


###################################################
### code chunk number 4: cgdsr.Rnw:110-111
###################################################
getGeneticProfiles(mycgds,'gbm_tcga')[,c(1:2)]


###################################################
### code chunk number 5: cgdsr.Rnw:129-130
###################################################
getCaseLists(mycgds,'gbm_tcga')[,c(1:2)]


###################################################
### code chunk number 6: cgdsr.Rnw:147-148
###################################################
getProfileData(mycgds, "NF1", c("gbm_tcga_gistic","gbm_tcga_mrna"), "gbm_tcga_all")[c(1:5),]


###################################################
### code chunk number 7: cgdsr.Rnw:154-155
###################################################
getProfileData(mycgds, c("MDM2","MDM4"), "gbm_tcga_mrna", "gbm_tcga_all")[c(1:5),]


###################################################
### code chunk number 8: cgdsr.Rnw:188-189
###################################################
getClinicalData(mycgds, "ova_all")[c(1:5),]


###################################################
### code chunk number 9: NF1plot1
###################################################
df = getProfileData(mycgds, "NF1", c("gbm_tcga_gistic","gbm_tcga_mrna"), "gbm_tcga_all")
head(df)
boxplot(df[,2] ~ df[,1], main="NF1 : CNA status vs mRNA expression", xlab="CNA status", ylab="mRNA expression", outpch = NA)
stripchart(df[,2] ~ df[,1], vertical=T, add=T, method="jitter",pch=1,col='red')


###################################################
### code chunk number 10: NF1plot2
###################################################
plot(mycgds, "gbm_tcga", "NF1", c("gbm_tcga_gistic","gbm_tcga_mrna"), "gbm_tcga_all", skin = 'disc_cont')


###################################################
### code chunk number 11: MDM2plot1
###################################################
df = getProfileData(mycgds, c("MDM2","MDM4"), "gbm_tcga_mrna", "gbm_tcga_all")
head(df)
plot(df, main="MDM2 and MDM4 mRNA expression", xlab="MDM2 mRNA expression", ylab="MDM4 mRNA expression")


###################################################
### code chunk number 12: MDMplot2
###################################################
plot(mycgds, "gbm_tcga", c("MDM2","MDM4"), "gbm_tcga_mrna" ,"gbm_tcga_all")


###################################################
### code chunk number 13: PTENplot
###################################################
df.pri = getProfileData(mycgds, "PTEN", "prad_mskcc_mrna_median_Zscores", "prad_mskcc_primary")
head(df.pri)
df.met = getProfileData(mycgds, "PTEN", "prad_mskcc_mrna_median_Zscores", "prad_mskcc_mets")
head(df.met)
boxplot(list(t(df.pri),t(df.met)), main="PTEN expression in primary and metastatic tumors", xlab="Tumor type", ylab="PTEN mRNA expression",names=c('primary','metastatic'), outpch = NA)
stripchart(list(t(df.pri),t(df.met)), vertical=T, add=T, method="jitter",pch=1,col='red')


