library(ICsurv)


### Name: PH.ICsurv.EM
### Title: EM algorithm for general interval-censored data under the
###   proportional hazards model
### Aliases: PH.ICsurv.EM

### ** Examples

data(Hemophilia)

d1<-Hemophilia[,1]
d2<-Hemophilia[,2]
d3<-Hemophilia[,3]
Li<-Hemophilia[,4]
Ri<-Hemophilia[,5]
Xp<-as.matrix(Hemophilia[,c(6,7,8)])

fit <- PH.ICsurv.EM(d1, d2, d3, Li, Ri, Xp, n.int=8, order=3, g0=rep(1,11), b0=rep(0,3),  tol=0.001,
 t.seq=seq(0,57,1), equal = TRUE)

fit$b  

# [1] 1.837590 3.018500 3.418981

fit$var.b

#             [,1]        [,2]        [,3]
#  [1,]  0.008526765 -0.01090578  0.01199610
#  [2,] -0.010905780  0.01265952 -0.01462116
#  [3,]  0.011996095 -0.01462116  0.08624411




