library(ACD)


### Name: funlinWLS
### Title: Fitting Functional Linear Models via Weighted Least Squares
### Aliases: funlinWLS
### Keywords: package categorical data

### ** Examples

	#Example 11.2 of Paulino and Singer (2006)
	e112.TF<-c(192,1,5,2,146,5,11,12,71)

	e112.catdata<-readCatdata(TF=e112.TF)
	
	e112.U<-rbind(c(0,-1, 0,1,0, 0,0,0),
    	          c(0, 0,-1,0,0, 0,1,0),
        	      c(0, 0, 0,0,0,-1,0,1))
	
	e112.X<-rbind(c(1,0,0,0,0),
    	          c(0,1,0,0,0),
        	      c(0,0,1,0,0),
            	  c(0,1,0,0,0),
	              c(0,0,0,1,0),
    	          c(0,0,0,0,1),
        	      c(0,0,1,0,0),
            	  c(0,0,0,0,1))

	#Two equivalent ways of fitting the same symmetry model
	e112.linwls1<-funlinWLS(model="lin",obj=e112.catdata,U=e112.U)
	e112.linwls2<-funlinWLS(model="lin",obj=e112.catdata,X=e112.X)
	e112.linwls1 #constraint formulation
	e112.linwls2 #freedom equation formulation
	summary(e112.linwls1)
	
	#Example 11.5 of Paulino and Singer (2006)
	e115.TF<-c(3,25,32,68)
	e115.catdata<-readCatdata(TF=e115.TF)
	e115.U<-c(1,-1,-1,1)

	e115.X<-rbind(c(0,0),c(0,1),c(1,0),c(1,1))

	e115.X2<-rbind(c(0,0,0),c(0,1,0),c(1,0,0),c(1,1,1))

	e115.loglinwls1<-funlinWLS(model=c("lin", "log"), obj=e115.catdata, 
				U=e115.U)
	e115.loglinwls2<-funlinWLS(model=c("lin", "log"), obj=e115.catdata, 
				X=e115.X)
	e115.loglinwls3<-funlinWLS(model=c("lin", "log"), obj=e115.catdata, 
				X=e115.X2)
	e115.loglinwls4<-funlinWLS(model=c("lin", "log"), obj=e115.catdata, 
				A1=c(1,-1,-1,1), XL=1) 

	#Independence ordinary log-linear model, constraint formulation
	e115.loglinwls1 
	
	#Independence ordinary log-linear model, freedom equation formulation
	e115.loglinwls2 

	#Saturated ordinary log-linear model, freedom equation formulation
	e115.loglinwls3 

	#Saturated generalized log-linear model, freedom equation formulation
	e115.loglinwls4 

	#95% confidence interval for log-odds ratio and for odds ratio

	round(e115.loglinwls4$beta+c(-1,1)*qnorm(0.975)*sqrt(e115.loglinwls4$Vbeta),3) 
	round(exp(e115.loglinwls4$beta),3)
	round(exp(e115.loglinwls4$beta+c(-1,1)*qnorm(0.975)*sqrt(e115.loglinwls4$Vbeta)),3)
	
	#Example 11.3 of Paulino and Singer (2006)
	e113.TF<-c(11,5,0,14,34,7,2,13,11)
	e113.catdata<-readCatdata(TF=e113.TF)

	e113.U<-rbind(c(0, 1,1,-1,0,0,-1, 0),
	              c(0,-1,0, 1,0,1, 0,-1))

	e113.X<-rbind(c(1, 0, 0,0,0,0),
    	          c(0, 1, 0,0,0,0),
        	      c(0,-1, 1,0,1,0),
            	  c(0, 0, 1,0,0,0),
	              c(0, 0, 0,1,0,0),
    	          c(0, 1,-1,0,0,1),
        	      c(0, 0, 0,0,1,0),
            	  c(0, 0, 0,0,0,1))

	e113.linwls1<-funlinWLS(model="lin",obj=e113.catdata,U=e113.U)
	e113.linwls2<-funlinWLS(model="lin",obj=e113.catdata,X=e113.X)

	e113.A<-rbind(c(1,1,1,0,0,0,0,0,0),
    	          c(0,0,0,1,1,1,0,0,0),
        	      c(1,0,0,1,0,0,1,0,0),
            	  c(0,1,0,0,1,0,0,1,0))

	e113.U2<-rbind(c(1,0,-1, 0),c(0,1, 0,-1))
	e113.X2<-rbind(c(1,0),c(0,1),c(1,0),c(0,1))

	e113.linwls3<-funlinWLS(model="lin",obj=e113.catdata,A1=e113.A,U=e113.U2)
	e113.linwls4<-funlinWLS(model="lin",obj=e113.catdata,A1=e113.A,X=e113.X2)

	#Four equivalent ways of fitting the same marginal homogeneity model
	e113.linwls1
	e113.linwls2
	e113.linwls3
	e113.linwls4

	#Example 11.12 of Paulino and Singer (2006)
	e1112.TF<-c(11,5,0,14,34,7,2,13,11)
	e1112.catdata<-readCatdata(TF=e1112.TF)

	e1112.A1<-rbind(c(rep(c(1,0,0,0),2),1),rep(1,9),
			  kronecker(diag(3),t(rep(1,3))),kronecker(t(rep(1,3)),diag(3)))

	e1112.A2<-rbind(cbind(diag(2),matrix(0,2,6)),
					cbind(matrix(0,3,2),kronecker(t(rep(1,2)),diag(3))))

	e1112.A3<-cbind(c(1,0),c(1,1),
					tcrossprod(-c(2,1),(rep(1,3))))

	e1112.A4<-t(c(1,-1))
	
	e1112.kappa<-funlinWLS(model = c("add", "exp", "lin", "log", "lin", 
	"exp", "lin", "log", "lin"),
	obj=e1112.catdata, A1=e1112.A1, A2=e1112.A2, A3=e1112.A3, A4=e1112.A4, 
	PI1=-1, X=1)

	# confidence interval
	round(e1112.kappa$beta+c(-1,1)*qnorm(0.975)*sqrt(e1112.kappa$Vbeta),3)

	#weighted kappa (Spitzer, Cohen, Fleiss e Endicott, 1967)
 	#squared weights (Fleiss e Cohen, 1973) 
	W1<-c(1,0.75,0,0.75,1,0.75,0,0.75,1)
 	
	#absolute weights (Cicchetti e Allison, 1971) 
	W2<-c(1,0.5,0,0.5,1,0.5,0,0.5,1)

	e1112.w1A1<-rbind(t(W1),rep(1,9),kronecker(diag(3),t(rep(1,3))),
					  kronecker(t(rep(1,3)),diag(3)))

	e1112.w2A1<-rbind(t(W2),rep(1,9),kronecker(diag(3),t(rep(1,3))),
					  kronecker(t(rep(1,3)),diag(3)))

	e1112.wA2<-rbind(cbind(diag(2),matrix(0,2,6)),cbind(matrix(0,9,2),
		 cbind(kronecker(diag(3),rep(1,3)),kronecker(rep(1,3),diag(3)))))

	e1112.w1A3<-cbind(c(1,0),c(1,1),kronecker(-c(2,1),t(W1)))

	e1112.w2A3<-cbind(c(1,0),c(1,1),kronecker(-c(2,1),t(W2)))

	e1112.kappaw1<-funlinWLS(model=c("add", "exp", "lin", "log", "lin", 
	"exp", "lin", "log", "lin"),
	 obj=e1112.catdata, A1=e1112.w1A1, A2=e1112.wA2, A3=e1112.w1A3, A4=e1112.A4,
	 PI1=-1, X=1)

	e1112.kappaw2<-funlinWLS(model=c("add", "exp", "lin", "log", "lin",
     	"exp", "lin","log", "lin"),
	 obj=e1112.catdata, A1=e1112.w2A1, A2=e1112.wA2, A3=e1112.w2A3, A4=e1112.A4,
	 PI1=-1, X=1)

	#Example 1 of Poleto et al (2012)
	smoking.TF<-rbind(c(167,17,19,10,1,3,52,10,11, 176,24,121, 28,10,12),
	                  c(120,22,19, 8,5,1,39,12,12, 103, 3, 80, 31, 8,14))

	smoking.Zp<-kronecker(t(rep(1,2)),cbind(kronecker(diag(3),rep(1,3)),
			kronecker(rep(1,3),diag(3))))

	smoking.Rp<-rbind(c(3,3),c(3,3))

	smoking.catdata<-readCatdata(TF=smoking.TF,Zp=smoking.Zp,Rp=smoking.Rp)

	smoking.catdata #Proportions of the complete data
	smoking.satmarml<-satMarML(smoking.catdata)
	smoking.satmcarml<-satMarML(smoking.catdata,missing="MCAR")
	smoking.satmcarwls<-satMcarWLS(smoking.catdata)

	smoking.E<-rbind(c(1,-1,0),c(0,1,-1))
	smoking.A<-kronecker(kronecker(diag(2),smoking.E),smoking.E)

	smoking.loglin2.marhybrid<-funlinWLS(model=c("lin","log"), 
			obj=smoking.satmarml, A1=smoking.A, XL=rep(1,8))

	smoking.loglin2.mcarhybrid<-funlinWLS(model=c("lin","log"), 
			obj=smoking.satmcarml, A1=smoking.A, XL=rep(1,8))

	smoking.loglin2.mcarwls<-funlinWLS(model=c("lin","log"), 
			obj=smoking.satmcarwls, A1=smoking.A, XL=rep(1,8))

	#MNAR example
	#Minus log-likelihood of the MNAR described in the last paragraph of Section 3
	mnar.mll<-function(p,fr){
	 # p=(pi11(1),...,pi33(2),a2(11),a2(21),a2(31),a3(11),
	 #                        a3(21),a3(31),a2(12),a2(22),
	 #                        a2(32),a3(12),a3(22),a3(32))
		
	 pi11.1<-p[1]; pi12.1<-p[2]; pi13.1<-p[3]
	 pi21.1<-p[4]; pi22.1<-p[5]; pi23.1<-p[6]
	 pi31.1<-p[7]; pi32.1<-p[8]
	 pi33.1=1-pi11.1-pi12.1-pi13.1-pi21.1-pi22.1-pi23.1-pi31.1-pi32.1

	 pi11.2<-p[9]; pi12.2<-p[10];pi13.2<-p[11]
	 pi21.2<-p[12];pi22.2<-p[13];pi23.2<-p[14]
	 pi31.2<-p[15];pi32.2<-p[16]
	 pi33.2=1-pi11.2-pi12.2-pi13.2-pi21.2-pi22.2-pi23.2-pi31.2-pi32.2

	 a2.1.1<-p[17];a2.2.1<-p[18];a2.3.1<-p[19]
	 a3.1.1<-p[20];a3.2.1<-p[21];a3.3.1<-p[22]

	 a2.1.2<-p[23];a2.2.2<-p[24];a2.3.2<-p[25]
	 a3.1.2<-p[26];a3.2.2<-p[27];a3.3.2<-p[28]

	 value<- -(
	  fr[1,1]*log(pi11.1*(1-a2.1.1-a3.1.1))+fr[1,2]*log(pi12.1*(1-a2.2.1-a3.1.1))+
	  fr[1,3]*log(pi13.1*(1-a2.3.1-a3.1.1))+
	  fr[1,4]*log(pi21.1*(1-a2.1.1-a3.2.1))+fr[1,5]*log(pi22.1*(1-a2.2.1-a3.2.1))+
	  fr[1,6]*log(pi23.1*(1-a2.3.1-a3.2.1))+
	  fr[1,7]*log(pi31.1*(1-a2.1.1-a3.3.1))+fr[1,8]*log(pi32.1*(1-a2.2.1-a3.3.1))+
	  fr[1,9]*log(pi33.1*(1-a2.3.1-a3.3.1))+

	  fr[1,10]*log(pi11.1*a2.1.1 + pi12.1*a2.2.1 + pi13.1*a2.3.1)+
	  fr[1,11]*log(pi21.1*a2.1.1 + pi22.1*a2.2.1 + pi23.1*a2.3.1)+
	  fr[1,12]*log(pi31.1*a2.1.1 + pi32.1*a2.2.1 + pi33.1*a2.3.1)+

	  fr[1,13]*log(pi11.1*a3.1.1 + pi21.1*a3.2.1 + pi31.1*a3.3.1)+
	  fr[1,14]*log(pi12.1*a3.1.1 + pi22.1*a3.2.1 + pi32.1*a3.3.1)+
	  fr[1,15]*log(pi13.1*a3.1.1 + pi23.1*a3.2.1 + pi33.1*a3.3.1)+

	  fr[2,1]*log(pi11.2*(1-a2.1.2-a3.1.2))+fr[2,2]*log(pi12.2*(1-a2.2.2-a3.1.2))+
	  fr[2,3]*log(pi13.2*(1-a2.3.2-a3.1.2))+
	  fr[2,4]*log(pi21.2*(1-a2.1.2-a3.2.2))+fr[2,5]*log(pi22.2*(1-a2.2.2-a3.2.2))+
	  fr[2,6]*log(pi23.2*(1-a2.3.2-a3.2.2))+
	  fr[2,7]*log(pi31.2*(1-a2.1.2-a3.3.2))+fr[2,8]*log(pi32.2*(1-a2.2.2-a3.3.2))+
	  fr[2,9]*log(pi33.2*(1-a2.3.2-a3.3.2))+

	  fr[2,10]*log(pi11.2*a2.1.2 + pi12.2*a2.2.2 + pi13.2*a2.3.2)+
	  fr[2,11]*log(pi21.2*a2.1.2 + pi22.2*a2.2.2 + pi23.2*a2.3.2)+
	  fr[2,12]*log(pi31.2*a2.1.2 + pi32.2*a2.2.2 + pi33.2*a2.3.2)+

	  fr[2,13]*log(pi11.2*a3.1.2 + pi21.2*a3.2.2 + pi31.2*a3.3.2)+
	  fr[2,14]*log(pi12.2*a3.1.2 + pi22.2*a3.2.2 + pi32.2*a3.3.2)+
	  fr[2,15]*log(pi13.2*a3.1.2 + pi23.2*a3.2.2 + pi33.2*a3.3.2)

	 )
	value
	}

	mnar.fit<-constrOptim(theta=c(rep(1/9,16), rep(1/3,12)), f=mnar.mll,
				method="Nelder-Mead", ui=diag(28), ci=rep(0,28),
				control=list(maxit=10000), outer.iterations=1000, fr=smoking.TF)

	#hessian matrix
	mnar.der<-deriv3(~-(
	 o1.1*log(pi11.1*(1-a2.1.1-a3.1.1))+o1.2*log(pi12.1*(1-a2.2.1-a3.1.1))+
	 o1.3*log(pi13.1*(1-a2.3.1-a3.1.1))+
	 o1.4*log(pi21.1*(1-a2.1.1-a3.2.1))+o1.5*log(pi22.1*(1-a2.2.1-a3.2.1))+
	 o1.6*log(pi23.1*(1-a2.3.1-a3.2.1))+
	 o1.7*log(pi31.1*(1-a2.1.1-a3.3.1))+o1.8*log(pi32.1*(1-a2.2.1-a3.3.1))+
  	 o1.9*log((1-pi11.1-pi12.1-pi13.1-pi21.1-
				 pi22.1-pi23.1-pi31.1-pi32.1)*(1-a2.3.1-a3.3.1))+
	 o1.10*log(pi11.1*a2.1.1 + pi12.1*a2.2.1 + pi13.1*a2.3.1)+
	 o1.11*log(pi21.1*a2.1.1 + pi22.1*a2.2.1 + pi23.1*a2.3.1)+
	 o1.12*log(pi31.1*a2.1.1 + pi32.1*a2.2.1 + 
     	(1-pi11.1-pi12.1-pi13.1-pi21.1-pi22.1-pi23.1-pi31.1-pi32.1)*a2.3.1)+
	 o1.13*log(pi11.1*a3.1.1 + pi21.1*a3.2.1 + pi31.1*a3.3.1)+
	 o1.14*log(pi12.1*a3.1.1 + pi22.1*a3.2.1 + pi32.1*a3.3.1)+
	 o1.15*log(pi13.1*a3.1.1 + pi23.1*a3.2.1 + 
		(1-pi11.1-pi12.1-pi13.1-pi21.1-pi22.1-pi23.1-pi31.1-pi32.1)*a3.3.1)+
	 o2.1*log(pi11.2*(1-a2.1.2-a3.1.2))+o2.2*log(pi12.2*(1-a2.2.2-a3.1.2))+
	 o2.3*log(pi13.2*(1-a2.3.2-a3.1.2))+
	 o2.4*log(pi21.2*(1-a2.1.2-a3.2.2))+o2.5*log(pi22.2*(1-a2.2.2-a3.2.2))+
	 o2.6*log(pi23.2*(1-a2.3.2-a3.2.2))+
	 o2.7*log(pi31.2*(1-a2.1.2-a3.3.2))+o2.8*log(pi32.2*(1-a2.2.2-a3.3.2)) +
		o2.9*log((1-pi11.2-pi12.2-pi13.2-pi21.2-
				  pi22.2-pi23.2-pi31.2-pi32.2)*(1-a2.3.2-a3.3.2))+
	 o2.10*log(pi11.2*a2.1.2 + pi12.2*a2.2.2 + pi13.2*a2.3.2)+
	 o2.11*log(pi21.2*a2.1.2 + pi22.2*a2.2.2 + pi23.2*a2.3.2)+
	 o2.12*log(pi31.2*a2.1.2 + pi32.2*a2.2.2 + 
		(1-pi11.2-pi12.2-pi13.2-pi21.2-pi22.2-pi23.2-pi31.2-pi32.2)*a2.3.2)+
	 o2.13*log(pi11.2*a3.1.2 + pi21.2*a3.2.2 + pi31.2*a3.3.2)+
	 o2.14*log(pi12.2*a3.1.2 + pi22.2*a3.2.2 + pi32.2*a3.3.2)+
	 o2.15*log(pi13.2*a3.1.2 + pi23.2*a3.2.2 + 
		(1-pi11.2-pi12.2-pi13.2-pi21.2-pi22.2-pi23.2-pi31.2-pi32.2)*a3.3.2)

	),c("pi11.1","pi12.1","pi13.1","pi21.1","pi22.1","pi23.1","pi31.1","pi32.1",
	 "pi11.2","pi12.2","pi13.2","pi21.2","pi22.2","pi23.2","pi31.2","pi32.2",
	 "a2.1.1","a2.2.1","a2.3.1","a3.1.1","a3.2.1","a3.3.1","a2.1.2","a2.2.2",
	 "a2.3.2","a3.1.2","a3.2.2","a3.3.2"),
	c("pi11.1","pi12.1","pi13.1","pi21.1","pi22.1","pi23.1","pi31.1","pi32.1",
	 "pi11.2","pi12.2","pi13.2","pi21.2","pi22.2","pi23.2","pi31.2","pi32.2",
	 "a2.1.1","a2.2.1","a2.3.1","a3.1.1","a3.2.1","a3.3.1","a2.1.2","a2.2.2",
	 "a2.3.2","a3.1.2","a3.2.2","a3.3.2",
	 "o1.1","o1.2","o1.3","o1.4","o1.5","o1.6","o1.7","o1.8","o1.9","o1.10",
	 "o1.11","o1.12","o1.13","o1.14","o1.15",
	 "o2.1","o2.2","o2.3","o2.4","o2.5","o2.6","o2.7","o2.8","o2.9","o2.10",
	 "o2.11","o2.12","o2.13","o2.14","o2.15")
	)
	
	p<-mnar.fit$par;TF<-smoking.TF
	mnar.InfObs<-mnar.der(p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8],p[9],p[10],
		p[11],p[12],p[13],p[14], p[15],p[16],p[17],p[18],p[19],p[20],p[21],
		p[22],p[23],p[24],p[25],p[26],p[27],p[28], TF[1,1],TF[1,2],TF[1,3],
		TF[1,4],TF[1,5],TF[1,6],TF[1,7],TF[1,8],TF[1,9],TF[1,10], 
		TF[1,11],TF[1,12],TF[1,13],TF[1,14],TF[1,15], 
		TF[2,1],TF[2,2],TF[2,3],TF[2,4],TF[2,5],TF[2,6],TF[2,7],TF[2,8],TF[2,9],TF[2,10], 
		TF[2,11],TF[2,12],TF[2,13],TF[2,14],TF[2,15])
	b<-smoking.catdata$b #b in (8), i.e., rep(1,2)%x%c(rep(0,8),1)
	B<-smoking.catdata$B #B in (8), i.e., diag(2)%x%rbind(diag(8),rep(-1,8))

	smoking.loglin2mnar.hybrid<-funlinWLS(model=c("lin","log"),  
		theta=as.vector(b+c(B%*%mnar.fit$par[1:16])), 
		Vtheta=B%*%solve(attr(mnar.InfObs,"hessian")[1,,])[1:16,1:16]%*%t(B),
		A1=smoking.A,X=rep(1,8))



