library(ACD)


### Name: satMarML
### Title: Fitting Saturated Models for the Marginal Probabilities of
###   Categorization via Maximum Likelihood under MAR and MCAR assumption
### Aliases: satMarML
### Keywords: categorical data

### ** Examples

#Example 13.4 of Paulino and Singer (2006)
e134.TF<-c(12,4,5,2, 50,31, 27,12)
e134.Zp<-cbind(kronecker(diag(2),rep(1,2)),kronecker(rep(1,2),diag(2)))
e134.Rp<-c(2,2)
e134.catdata<-readCatdata(TF=e134.TF,Zp=e134.Zp,Rp=e134.Rp)
e134.satmcarml<-satMarML(e134.catdata,missing="MCAR")
e134.satmarml<-satMarML(e134.catdata,method="FS-MCAR")
e134.satmarml2<-satMarML(e134.catdata,method="NR/FS-MAR")
e134.satmcarml

#Compare the estimates of the probabilities, standard errors, 
#number of iterations and augmented frequencies
summary(e134.satmcarml)
summary(e134.satmarml)
summary(e134.satmarml2)

#Example 1 of Poleto et al (2012)
smoking.TF<-rbind(c(167,17,19,10,1,3,52,10,11, 176,24,121, 28,10,12),
				  c(120,22,19, 8,5,1,39,12,12, 103, 3, 80, 31, 8,14))

smoking.Zp <- kronecker(t(rep(1,2)),
					cbind(kronecker(diag(3),rep(1,3)),
  				    kronecker(rep(1,3),diag(3))))

smoking.Rp<-rbind(c(3,3),c(3,3))
smoking.catdata<-readCatdata(TF=smoking.TF,Zp=smoking.Zp,Rp=smoking.Rp)
smoking.catdata

smoking.satmcarml<-satMarML(smoking.catdata,missing="MCAR")
smoking.satmarml<-satMarML(smoking.catdata,method="FS-MCAR")
smoking.satmarml2<-satMarML(smoking.catdata,method="NR/FS-MAR")
smoking.satmarml
summary(smoking.satmcarml)
summary(smoking.satmarml)
summary(smoking.satmarml2)



