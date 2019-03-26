library(metaBLUE)


### Name: BLUE_c
### Title: BLUEs of global location and scale parameters
### Aliases: BLUE_c

### ** Examples

n1<-30 # sample sizes of three included studies
n2<-45
n3<-67
X1<-c(3,1.2) # the mean and standard deviation
X2<-c(1,4,10) # the sample mean, minimum and maximum values
X3<-c(1.5,3,5.5,8,12) # the sample mean, first and third quartiles, and minimum and maximum values
X_c<-c(X1[1],X2,X3)

alpha1<-0  #Approximate by the CLT.
B1<-1/sqrt(n1)
alpha2<-BLUE_s(X2,n2,"S1")$alpha
B2<-BLUE_s(X2,n2,"S1")$B
alpha3<-BLUE_s(X3,n3,"S3")$alpha
B3<-BLUE_s(X3,n3,"S3")$B

alpha_c<-c(alpha1,alpha2,alpha3)
B_c<-Matrix::bdiag(B1,B2,B3)

BLUE_c(alpha_c,B_c,X_c)




