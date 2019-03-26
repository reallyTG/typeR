library(ACD)


### Name: loglinML
### Title: Fitting Log-Linear Models via Maximum Likelihood
### Aliases: loglinML
### Keywords: package categorical data

### ** Examples

	#Example 9.1 of Paulino and Singer (2006)
	e91.TF<-c(3,25,32,68)
	e91.catdata<-readCatdata(TF=e91.TF)
	e91.U<-c(1,-1,-1,1)
	
	e91.X<-rbind(c(0,0), c(0,1),
	             c(1,0), c(1,1))

	e91.X2<-rbind(c(0,0,0),
    	          c(0,1,0),
        	      c(1,0,0),
	              c(1,1,1))
	
	e91.loglinml1<-loglinML(e91.catdata,U=e91.U)
	e91.loglinml2<-loglinML(e91.catdata,X=e91.X)
	e91.loglinml3<-loglinML(e91.catdata,X=e91.X2)
	e91.loglinml4<-loglinML(e91.catdata,A=c(1,-1,-1,1),XL=1)

	# Independence ordinary log-linear model, constraint formulation
	e91.loglinml1 
	# Independence ordinary log-linear model, freedom equation formulation
	e91.loglinml2 
	#Saturated ordinary log-linear model, freedom equation formulation
	e91.loglinml3 

	#Saturated generalized log-linear model, freedom equation formulation
	e91.loglinml4 
	
	#95% confidence interval for log-odds ratio and for odds ratio
	round(e91.loglinml4$beta+c(-1,1)*qnorm(0.975)*sqrt(e91.loglinml4$Vbeta),3)
	round(exp(e91.loglinml4$beta),3)
	round(exp(e91.loglinml4$beta+c(-1,1)*qnorm(0.975)*sqrt(e91.loglinml4$Vbeta)),3)

	#Example 1 of Poleto et al (2012)
	smoking.TF<-rbind(c(167,17,19,10,1,3,52,10,11, 176,24,121, 28,10,12),
	                  c(120,22,19, 8,5,1,39,12,12, 103, 3, 80, 31, 8,14))
	
	smoking.Zp<-t(rep(1,2))%x%cbind(diag(3)%x%rep(1,3), rep(1,3)%x%diag(3))
	
	smoking.Rp<-rbind(c(3,3),c(3,3))
	
	smoking.catdata<-readCatdata(TF=smoking.TF,Zp=smoking.Zp,Rp=smoking.Rp)
	smoking.catdata #Proportions of the complete data
	
	smoking.satmarml<-satMarML(smoking.catdata)
	smoking.satmcarml<-satMarML(smoking.catdata,missing="MCAR")
	
	smoking.E<-rbind(c(1,-1,0),c(0,1,-1))
	
	smoking.A<-diag(2)%x%smoking.E%x%smoking.E
	smoking.loglin2.marml<-loglinML(smoking.satmarml,A=smoking.A,XL=rep(1,8))
	smoking.loglin2.mcarml<-loglinML(smoking.satmcarml,A=smoking.A,XL=rep(1,8))



