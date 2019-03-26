library(nopaco)


### Name: rfromPsi
### Title: Convertion between Pearson correlation and the non paramtric
###   concordance coefficient
### Aliases: rfromPsi psifromR

### ** Examples


#Generate a matrix without concordance
matRandom <- matrix(rnorm(30),10,3)
result<-concordance.test(matRandom)
getPsi(result) #concordance coefficient
result$ci      #95% confidence interval

#Corresonding Pearson correlation
rfromPsi(getPsi(result))
rfromPsi(result$ci)

#Plot the relation between Pearson correlation and the nonparamatric concordance coefficient.
r<-seq(-1,1,0.01)
psi<-psifromR(r)
plot(r,psi,type='l',xlab="Pearson correlation", ylab="nonparametric concordance")




