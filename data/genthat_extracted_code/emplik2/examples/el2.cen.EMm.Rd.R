library(emplik2)


### Name: el2.cen.EMm
### Title: Computes p-value for multiple mean-type hypotheses, based on two
###   independent samples that may contain censored data.
### Aliases: el2.cen.EMm
### Keywords: nonparametric

### ** Examples
 
x<-c(10, 80, 209, 273, 279, 324, 391, 415, 566, 85, 852, 881, 895, 954, 1101, 1133,
1337, 1393, 1408, 1444, 1513, 1585, 1669, 1823, 1941)
dx<-c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0)
y<-c(21, 38, 39, 51, 77, 185, 240, 289, 524, 610, 612, 677, 798, 881, 899, 946, 1010,
1074, 1147, 1154, 1199, 1269, 1329, 1484, 1493, 1559, 1602, 1684, 1900, 1952)
dy<-c(1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0)
nx<-length(x)
ny<-length(y)
xc<-1:nx
yc<-1:ny
wx<-rep(1,nx)
wy<-rep(1,ny)
maxit<-10
mean=c(0.5,0.5)
p<-2
H1<-matrix(NA,nrow=nx,ncol=ny)
H2<-matrix(NA,nrow=nx,ncol=ny)
for (i in 1:nx) {
  for (j in 1:ny) {
   H1[i,j]<-(x[i]>y[j])
   H2[i,j]<-(x[i]>1060) } }
H=matrix(c(H1,H2),nrow=nx,ncol=p*ny)

# Ho1: X is stochastically equal to Y
# Ho2: mean of X equals mean of Y

el2.cen.EMm(x, dx, y, dy, p, H, xc=1:length(x), yc=1:length(y),
  mean, maxit=10)

# Result: Pval is 0.6310234, so we cannot with 95 percent confidence reject the two
# simultaneous hypotheses Ho1 and Ho2



