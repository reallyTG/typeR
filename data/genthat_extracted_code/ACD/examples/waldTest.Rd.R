library(ACD)


### Name: waldTest
### Title: Wald Test
### Aliases: waldTest
### Keywords: package categorical data

### ** Examples

#Example 11.7 of Paulino and Singer (2006)
e117.TF<-rbind(c(28,40,68),
               c( 5,21,49),
   	           c( 1, 4,15))

e117.catdata<-readCatdata(TF=e117.TF)
e117.A<-kronecker(diag(3),cbind(diag(2),rep(-1,2)))
e117.X1<-rbind(c(1,0,0,0),
               c(0,1,0,0),
   	           c(1,0,2,0),
       	       c(0,1,1,0),
           	   c(1,0,0,2),
               c(0,1,0,1))

e117.loglinwls1<-funlinWLS(model=c("lin","log"), obj=e117.catdata, 
	A1=e117.A,XL=e117.X1)
waldTest(obj=e117.loglinwls1,C=cbind(0*diag(2),diag(2)))



