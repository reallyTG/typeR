library(ACD)


### Name: linML
### Title: Fitting Linear Models via Maximum Likelihood
### Aliases: linML
### Keywords: package categorical data

### ** Examples

#Example 8.1 of Paulino and Singer (2006)

e81.TF<-c(192,1,5,2,146,5,11,12,71)
e81.catdata<-readCatdata(TF=e81.TF)

e81.U<-rbind(c(0,-1, 0,1,0, 0,0,0),
			 c(0, 0,-1,0,0, 0,1,0),
			 c(0, 0, 0,0,0,-1,0,1))

e81.X<-rbind(c(1,0,0,0,0),
			 c(0,1,0,0,0),
			 c(0,0,1,0,0),
			 c(0,1,0,0,0),
			 c(0,0,0,1,0),
			 c(0,0,0,0,1),
			 c(0,0,1,0,0),
			 c(0,0,0,0,1))

#Two equivalent ways of fitting the same symmetry model

e81.linml1<-linML(e81.catdata,U=e81.U)
e81.linml2<-linML(e81.catdata,X=e81.X)
e81.linml1 #constraint formulation
e81.linml2 #freedom equation formulation
summary(e81.linml1)

#Example 8.2 of Paulino and Singer (2006)
e82.TF<-c(11,5,0,14,34,7,2,13,11)

e82.catdata<-readCatdata(TF=e82.TF)

e82.U<-rbind(c(0, 1,1,-1,0,0,-1, 0),
			 c(0,-1,0, 1,0,1, 0,-1))
e82.X<-rbind(c(1, 0, 0,0,0,0),
			 c(0, 1, 0,0,0,0),
			 c(0,-1, 1,0,1,0),
			 c(0, 0, 1,0,0,0),
			 c(0, 0, 0,1,0,0),
			 c(0, 1,-1,0,0,1),
			 c(0, 0, 0,0,1,0),
			 c(0, 0, 0,0,0,1))

e82.linml1<-linML(e82.catdata,U=e82.U)

e82.linml2<-linML(e82.catdata,X=e82.X)

e82.A<-rbind(c(1,1,1,0,0,0,0,0,0),
			 c(0,0,0,1,1,1,0,0,0),
			 c(1,0,0,1,0,0,1,0,0),
			 c(0,1,0,0,1,0,0,1,0))

e82.U2<-rbind(c(1,0,-1, 0),
			  c(0,1, 0,-1))

e82.X2<-rbind(c(1,0),
			  c(0,1),
			  c(1,0),
			  c(0,1))

e82.linml3<-linML(e82.catdata,A=e82.A,U=e82.U2)
e82.linml4<-linML(e82.catdata,A=e82.A,X=e82.X2)

#Four equivalent ways of fitting the same marginal homogeneity model
e82.linml1;e82.linml2;e82.linml3;e82.linml4

#Example 13.2 of Paulino and Singer (2006)

e132.TF2<-c(7,11,2,3,9,5,1e-5,10,4, 8,7,3,0, 0,7,14,7) #replace zero by small value
e132.Zp<-cbind(rbind(cbind(
			   kronecker(rep(1,2),diag(3)),rep(0,6)),
 			   cbind(matrix(0,3,3),rep(1,3)) ),
			   rbind(cbind(rep(1,3),matrix(0,3,3)),
			   cbind(rep(0,6),kronecker(rep(1,2),diag(3)))))
e132.Rp<-c(4,4)
e132.catdata2<-readCatdata(TF=e132.TF2,Zp=e132.Zp,Rp=e132.Rp) 

e132.satmarml2<-satMarML(e132.catdata2)

e132.U<-rbind(c(0, 1,1,-1,0,0,-1, 0),
			  c(0,-1,0, 1,0,1, 0,-1) )

e132.linml<-linML(e132.satmarml2,U=e132.U)

#Example 2 of Poleto et al (2012)
obes.TF<-rbind(
	   c( 90, 9, 3, 7, 0,1, 1, 8,16, 5,0, 0, 9,3,0,0,129,18,6,13,32, 5,33,11,70,24),
	   c(150,15, 8, 8, 8,9, 7,20,38, 3,1,11,16,6,1,3, 42, 2,3,13,45, 7,33, 4,55,14),
	   c(152,11, 8,10, 7,7, 9,25,48, 6,2,14,13,5,0,3, 36, 5,4, 3,59,17,31, 9,40, 9),
	   c(119, 7, 8, 3,13,4,11,16,42, 4,4,13,14,2,1,4, 18, 3,3, 1,82,24,23, 6,37,14),
	   c(101, 4, 2, 7, 8,0, 6,15,82, 9,8,12, 6,1,0,1, 13, 1,2, 2,95,23,34,12,15, 3),
	   c( 75, 8, 2, 4, 2,2, 1, 8,20, 0,0, 4, 7,2,0,1,109,22,7,24,23, 5,27, 5,65,19),
	   c(154,14,13,19, 2,6, 6,21,25, 3,1,11,16,3,0,4, 47, 4,1, 8,47, 7,23, 5,39,13),
	   c(148, 6,10, 8,12,0, 8,27,36, 0,7,17, 8,1,1,4, 39, 6,7,13,53,16,25, 9,23, 8),
	   c(129, 8, 7, 9, 6,2, 7,14,36, 9,4,13,31,4,2,6, 19, 1,2, 2,58,37,21, 1,23,10),
	   c( 91, 9, 5, 3, 6,0, 6,15,83,15,6,23, 5,0,0,1, 11, 1,2, 3,89,32,43,15,14, 5))


obes.Zp<-kronecker(t(rep(1,10)),
				   cbind(kronecker(diag(4),rep(1,2)),
						 kronecker(diag(2),kronecker(rep(1,2),diag(2))),
						 kronecker(rep(1,2),diag(4)),
						 kronecker(diag(2),rep(1,4)),
						 kronecker(rep(1,2),kronecker(diag(2),rep(1,2))),
						 kronecker(rep(1,4),diag(2))))

obes.Rp<-kronecker(rep(1,10),t(c(4,4,4,2,2,2)))
obes.catdata<-readCatdata(TF=obes.TF,Zp=obes.Zp,Rp=obes.Rp)
obes.mar<-satMarML(obes.catdata)

obes.A.marg <- kronecker(diag(10),t(cbind(
   			   kronecker(diag(2),rep(1,4)),
			   kronecker(rep(1,2),kronecker(diag(2),rep(1,2))),
			   kronecker(rep(1,4),diag(2))))[c(2,4,6),])

obes.age<-c(6,8,10,8,10,12,10,12,14,12,14,16,14,16,18)
obes.X2<-kronecker(diag(2),cbind(rep(1,15),obes.age,obes.age^2))

# Not run
# obes.lin2.ml<-linML(obes.mar,A=obes.A.marg,X=obes.X2)

obesR.TF<-obes.TF

obesR.TF[obesR.TF==0]<-1e-6 #Replacing null frequencies by 10^{-6}

obesR.catdata<-readCatdata(TF=obesR.TF,Zp=obes.Zp,Rp=obes.Rp)
obesR.mar<-satMarML(obesR.catdata)
obesR.lin2.ml<-linML(obesR.mar,A=obes.A.marg,X=obes.X2)

obesR.lin2.ml



