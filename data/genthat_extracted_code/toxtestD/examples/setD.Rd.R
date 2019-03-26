library(toxtestD)


### Name: setD
### Title: setD: Determining the optimal number of objects per treatment
### Aliases: setD
### Keywords: design

### ** Examples

 # sample size calculation per treatment and experimental run
 setD(nmax=350,SL.p=5.5,immunity.p=0,risk.type=2,target.EC=10,
      alpha.p=5,beta.p=20,plot="single")
 setD(nmax=350,SL.p=3,target.EC=5,plot="FALSE")
 setD(nmax=350,SL.p=3,target.EC=5,plot="FALSE",print.result="setD.txt")
 setD(nmax=350,SL.p=3,target.EC=5,plot="FALSE",print.result=FALSE)



