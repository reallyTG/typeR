library(MultAlloc)


### Name: BSSM_FD
### Title: Optimal Allocation - Minimum Sum of Relative Variances
### Aliases: BSSM_FD
### Keywords: ~kwd1 ~kwd2

### ** Examples

#Example1
#Unit level survey costs for sampling from the strata are assumed to be the same.
#Number of survey variables (m=2) and seven strata (H=7)
#ch=1 ==> Cust = n
Nh<-c(49,78,20,39,73,82,89)
Yj<-c(542350,56089251)
Sh2j<-rbind(c(4436978,5581445,33454902,5763294,8689167,3716130,13938505),
            c(11034299660,40919330279,33519355946,18228286901,74247764986,49062224184,5783096806))
n<-200 #sample size
result<-BSSM_FD(Nh,Sh2j,Yj,Cust=n)

#Example2
#Unit level survey costs for sampling from the strata are assumed to be the same.
#ch=1 ==> Cust = n
#nmin>2
Nh<-c(49,78,20,39,73,82,89)
Yj<-c(542350,56089251)
Sh2j<-rbind(c(4436978,5581445,33454902,5763294,8689167,3716130,13938505),
            c(11034299660,40919330279,33519355946,18228286901,74247764986,49062224184,5783096806))
nmin<-20
n<-200
result<-BSSM_FD(Nh,Sh2j,Yj,nmin,Cust=n)

#Example3
#certain=TRUE
Nh<-c(49,78,20,39,73,82,89)
Yj<-c(542350,56089251)
Sh2j<-rbind(c(4436978,5581445,33454902,5763294,8689167,3716130,13938505),
            c(11034299660,40919330279,33519355946,18228286901,74247764986,49062224184,5783096806))
n<-200
result<-BSSM_FD(Nh,Sh2j,Yj,Cust=n,certain=TRUE)


#Example4
#Relative importance of the survey variables is different
w<-c(0.3,0.7)
Nh<-c(49,78,20,39,73,82,89)
Yj<-c(542350,56089251)
Sh2j<-rbind(c(4436978,5581445,33454902,5763294,8689167,3716130,13938505),
            c(11034299660,40919330279,33519355946,18228286901,74247764986,49062224184,5783096806))
n<-200
result<-BSSM_FD(Nh,Sh2j,Yj,Cust=n,w=w)


#Example5
#Number of survey variables m=1
Nh<-c(49,78,20,39,73,82,89)
Yj<-542350
Sh2j<-c(4436978,5581445,33454902,5763294,8689167,3716130,13938505)
n<-100
result<-BSSM_FD(Nh,Sh2j,Yj,Cust=n)





