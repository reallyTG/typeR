library(stratbr)


### Name: BSSM_FD
### Title: Optimal Allocation - Minimum Coefficient of Variation
### Aliases: BSSM_FD

### ** Examples

X<-round(100*runif(50))
Nh<-c(10,20,20)
Sh2x<-c(var(X[1:10]),var(X[11:30]),var(X[31:50]))
aloc1<-BSSM_FD(Nh,Sh2x,n=40,H=3,nmin=2,sum(X),takeall=TRUE)
Nh<-c(49,78,20,39,73,82,89)
X<-542350
Sh2x<-c(4436978,5581445,33454902,5763294,8689167,3716130,13938505)
aloc2<-BSSM_FD(Nh,Sh2x,n=100,H=7,nmin=2,X)



