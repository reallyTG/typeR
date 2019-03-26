### R code from vignette source 'iECAT.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: data
###################################################
library(SKAT)
library(iECAT)
data(Example)
attach(Example)


###################################################
### code chunk number 2: iECAT1
###################################################

# iECAT-O
# test the first gene

obj<-SKAT_Null_Model(Y ~ 1, out_type="D")
Z = Z.list[[1]]
tbl.external.all = tbl.external.all.list[[1]]

out<-iECAT(Z, obj, tbl.external.all, method="optimal")

#iECAT-O pvalue
out$p.value

# p-value without batch-effect adjustment 
out$p.value.noadj

# p-value computed without using external control samples. SKAT-O is used to compute this p-value. 
out$p.value.internal



###################################################
### code chunk number 3: iECAT11
###################################################

# rho=0
iECAT(Z, obj, tbl.external.all, r.corr=0)$p.value

# rho=1
iECAT(Z, obj, tbl.external.all, r.corr=1)$p.value



###################################################
### code chunk number 4: iECAT12
###################################################

# test for rare variants only
iECAT(Z, obj, tbl.external.all, MAF.limit=0.01)$p.value


###################################################
### code chunk number 5: iECAT_B1
###################################################
# To run this code, first download and unzip example files

##############################################
# 	Generate SSD file

# Create the MW File


File.Bed<-"./iECAT.example.bed"
File.Bim<-"./iECAT.example.bim"
File.Fam<-"./iECAT.example.fam"
File.EC<-"./iECAT.example.EC"
File.SetID<-"./iECAT.example.SetID"

File.SSD<-"./iECAT.SSD"
File.Info<-"./iECAT.SSD.INFO"
File.EC.Info<-"./iECAT.SSD.ECINFO"

FAM<-Read_Plink_FAM(File.Fam, Is.binary=TRUE)

# 5 SNP sets in the example in the vignette
Generate_SSD_SetID_wEC(File.Bed, File.Bim, File.Fam, File.SetID, File.EC, File.SSD, File.Info, File.EC.Info)
EC.INFO= Open_SSD_wEC(File.SSD, File.Info, File.EC.Info)

obj<-SKAT_Null_Model(Phenotype ~ 1, out_type="D", data=FAM)


re<-iECAT.SSD.All(EC.INFO, obj=obj, method="optimal")
re



