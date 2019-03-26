library(VIGoR)


### Name: hyperpara
### Title: Calculation of hyperparameter values
### Aliases: hyperpara

### ** Examples

#data
data(sampledata)
dim(Geno)#100 samples and 1000 markers
unique(Geno[1:(100*1000)])#coded as 0, 1, 2

#A single Kappa value is assumed for BL. A vector is returned.
hyperpara(Geno,0.5,"BL",0.01,Printinfo=TRUE)

#Phi is set to 1 as default. To change Phi, use BL.Phi.
hyperpara(Geno,0.5,"BL",0.01,BL.Phi=5)

#Calculate multiple hyperparameter value sets of BayesC assuming that Kappa is 0.01, 0.1, and 1.
#A matrix is returned.
hyperpara(Geno,0.5,"BayesC",c(0.01,0.1,1))

#The output vector can be used as the argument of vigor
Result<-vigor(Pheno$Height,Geno,"wBSR",hyperpara(Geno,0.5,"wBSR",0.01))

#Calculate multiple hyperparameter sets of SSVS 
#assuming that Mvar is 0.5, Kappa is 0.01 and 0.1, and A is 0.9 and 0.99.
hyperpara(Geno,0.5,"SSVS",c(0.01,0.1),c(0.9,0.99))
#2 x 2 sets are created.

#Calculate hyperparameter values of BayesB 
#assuming that Mvar is 0.5, and Kappa is 0.01. Inbred lines are analyzed.
hyperpara(Geno,0.5,"BayesB",0.01,f=1)

#Calculate hyperparameter values of EBL
#assuming that Mvar is 0.5, and Kappa is 0.01. Consider marker genotypes as general variables.
hyperpara(Geno,0.5,"EBL",0.01,Xtype="Var")



