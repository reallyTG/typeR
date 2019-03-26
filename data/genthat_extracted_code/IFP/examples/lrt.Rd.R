library(IFP)


### Name: lrt
### Title: Likelihood Ratio Tests for Identifying Number of Functional
###   Polymorphisms
### Aliases: lrt

### ** Examples

## LRT tests when SNP1 & SNP6 are the functional polymorphisms.

data(apoe)

n<-c(2000, 2000, 2000, 2000, 2000, 2000, 2000) #case sample size = 1000
x<-c(1707, 281,1341, 435, 772, 416, 1797) #allele numbers in case samples 


Z<-2 	#number of functional SNPs for tests
n.poly<-ncol(apoe7)/2 	#total number of SNPs

#control sample generation( sample size = 1000 )
con.samp<-sample(nrow(apoe7),1000,replace=TRUE)
con.data<-array()
for (i in con.samp){
con.data<-rbind(con.data,apoe7[i,])
}
con.data<-con.data[2:1001,]

lrt(1,n,x,con.data)
lrt(2,n,x,con.data)



