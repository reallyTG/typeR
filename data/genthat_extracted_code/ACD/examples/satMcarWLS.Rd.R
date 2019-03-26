library(ACD)


### Name: satMcarWLS
### Title: Fitting Saturated Models for the Marginal Probabilities of
###   Categorization via Weighted Least Squares under MCAR assumption
### Aliases: satMcarWLS
### Keywords: package categorical data

### ** Examples

	#Example 13.4 of Paulino and Singer (2006)
	e134.TF<-c(12,4,5,2, 50,31, 27,12)
	e134.Zp<-cbind(kronecker(diag(2),rep(1,2)),kronecker(rep(1,2),diag(2)))
	e134.Rp<-c(2,2)
	e134.catdata<-readCatdata(TF=e134.TF,Zp=e134.Zp,Rp=e134.Rp)
	e134.satmcarwls<-satMcarWLS(e134.catdata)
	e134.satmcarwls
	
	#Example 1 of Poleto et al (2012)
	smoking.TF<-rbind(c(167,17,19,10,1,3,52,10,11, 176,24,121, 28,10,12),
	                  c(120,22,19, 8,5,1,39,12,12, 103, 3, 80, 31, 8,14))
	smoking.Zp<-t(rep(1,2))%x%cbind(diag(3)%x%rep(1,3), rep(1,3)%x%diag(3))
	smoking.Rp<-rbind(c(3,3),c(3,3))
	smoking.catdata<-readCatdata(TF=smoking.TF,Zp=smoking.Zp,Rp=smoking.Rp)
	smoking.satmcarwls<-satMcarWLS(smoking.catdata)
	smoking.satmcarwls



