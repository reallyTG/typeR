library(ACD)


### Name: readCatdata
### Title: Reads Categorical Data
### Aliases: readCatdata
### Keywords: package categorical data

### ** Examples

#Example 1.5 of Paulino and Singer (2006)
#S=4 subpopulations, R=4 response categories, with complete data
e15.TF<-rbind(c(19, 5, 4, 2),
			  c( 5, 8, 0,17),
			  c(11, 6, 7, 6),
			  c( 2, 5, 1,22))
e15.catdata<-readCatdata(TF=e15.TF)

e15.catdata #shows proportions and standard errors

#Example 13.4 of Paulino and Singer (2006)
#S=1 subpopulation, R=4 response categories, with missing data
#2 missingness patterns with 2 response classes each
e134.TF<-c(12,4,5,2, 50,31, 27,12)
e134.Zp<-cbind(kronecker(diag(2),rep(1,2)),kronecker(rep(1,2),diag(2)))
e134.Rp<-c(2,2)
e134.catdata<-readCatdata(TF=e134.TF,Zp=e134.Zp,Rp=e134.Rp)
e134.catdata #Proportions of the complete data
summary(e134.catdata) #A more detailed analysis of the missing data input

#Example 13.2 of Paulino and Singer (2006)
#S=1 subpopulation, R=9 response categories, with missing data
#2 missingness patterns with 4 response classes each
e132.TF<-c(7,11,2,3,9,5,0,10,4, 8,7,3,0, 0,7,14,7)
e132.Zp<-cbind(rbind(cbind(kronecker(rep(1,2),diag(3)),rep(0,6)),
		 cbind(matrix(0,3,3),rep(1,3)) ),
	     rbind(cbind(rep(1,3),matrix(0,3,3)),
		 cbind(rep(0,6),kronecker(rep(1,2),diag(3)))))

e132.Rp<-c(4,4)

e132.catdata<-readCatdata(TF=e132.TF,Zp=e132.Zp,Rp=e132.Rp)
summary(e132.catdata)

#Example 1 of Poleto et al (2012)
#S=2 subpopulation, R=9 response categories, with missing data
#in each subpopulation: 2 missingness patterns with 3 response classes each
smoking.TF<-rbind(c(167,17,19,10,1,3,52,10,11, 176,24,121, 28,10,12),
				  c(120,22,19, 8,5,1,39,12,12, 103, 3, 80, 31, 8,14))
smoking.Zp<-t(rep(1,2))%x%cbind(diag(3)%x%rep(1,3), rep(1,3)%x%diag(3))
smoking.Rp<-rbind(c(3,3),c(3,3))
smoking.catdata<-readCatdata(TF=smoking.TF,Zp=smoking.Zp,Rp=smoking.Rp)
smoking.catdata

#Example 2 of Poleto et al (2012)
#S=10 subpopulation, R=8 response categories, with missing data
#in each subpopulation: 6 missingness patterns, 3 patterns with 4 response
#classes each, and other 3 patterns with 2 response classes
obes.TF<-rbind(
	c(90, 9, 3, 7, 0,1, 1, 8,16, 5,0, 0, 9,3,0,0,129,18,6,13,32, 5,33,11,70,24),
	c(150,15, 8, 8, 8,9, 7,20,38, 3,1,11,16,6,1,3, 42, 2,3,13,45, 7,33, 4,55,14),
	c(152,11, 8,10, 7,7, 9,25,48, 6,2,14,13,5,0,3, 36, 5,4, 3,59,17,31, 9,40, 9),
	c(119, 7, 8, 3,13,4,11,16,42, 4,4,13,14,2,1,4, 18, 3,3, 1,82,24,23, 6,37,14),
	c(101, 4, 2, 7, 8,0, 6,15,82, 9,8,12, 6,1,0,1, 13, 1,2, 2,95,23,34,12,15, 3),
	c( 75, 8, 2, 4, 2,2, 1, 8,20, 0,0, 4, 7,2,0,1,109,22,7,24,23, 5,27, 5,65,19),
	c(154,14,13,19, 2,6, 6,21,25, 3,1,11,16,3,0,4, 47, 4,1, 8,47, 7,23, 5,39,13),
	c(148, 6,10, 8,12,0, 8,27,36, 0,7,17, 8,1,1,4, 39, 6,7,13,53,16,25, 9,23, 8),
	c(129, 8, 7, 9, 6,2, 7,14,36, 9,4,13,31,4,2,6, 19, 1,2, 2,58,37,21, 1,23,10),
	c(91, 9, 5, 3, 6,0, 6,15,83,15,6,23, 5,0,0,1, 11, 1,2, 3,89,32,43,15,14, 5))

obes.Zp<-t(rep(1,10))%x%cbind(diag(4)%x%rep(1,2),
		  diag(2)%x%rep(1,2)%x%diag(2), rep(1,2)%x%diag(4),
		  diag(2)%x%rep(1,4),rep(1,2)%x%diag(2)%x%rep(1,2), rep(1,4)%x%diag(2))

obes.Rp<-rep(1,10)%x%t(c(4,4,4,2,2,2))
obes.catdata<-readCatdata(TF=obes.TF,Zp=obes.Zp,Rp=obes.Rp)
obes.catdata #Proportions of the complete data



