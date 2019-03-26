library(DunnettTests)


### Name: cvSUDT
### Title: To calculate the critical constants for step-up Dunnett test
###   procedure
### Aliases: cvSUDT
### Keywords: step-up Dunnett critical value

### ** Examples

#Compare four treatment arms to one control 
#with test statistics 2.2(H1), 2.7(H2), 2.1(H3), 0.85(H4). 
n=c(100,80,80,60)
n0=60
corr.matrix<-matrix(0,4,4)
diag(corr.matrix)=rep(1,4)
for(i in 1:3){
   for(j in (i+1):4){
     corr.matrix[i,j]=(1/n0)/(sqrt(1/n[i]+1/n0)*sqrt(1/n[j]+1/n0))
     corr.matrix[j,i]= corr.matrix[i,j]
   }
}
#The critical constants are given by

cvSUDT(k=4,df=sum(n)+n0-5,corr.matrix=corr.matrix)

#At overall one-sided significance level 0.05, 
#accepy H4 but reject H3 and hence H1 and H2.



