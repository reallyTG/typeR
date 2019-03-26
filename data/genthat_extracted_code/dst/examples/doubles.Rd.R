library(dst)


### Name: doubles
### Title: Remove duplicate rows in a two-dimensional table
### Aliases: doubles

### ** Examples

td0<-matrix(c(rep(c(1,0,1),times=3),0,0,1,1,1,1, 1,1,1),ncol=3,byrow=TRUE)
(doubles(td0))
td1<-matrix(c(rep(c(1,0,1),times=3),0,0,1,1,1,1),ncol=3,byrow=TRUE)
(doubles(td1))
td2<-matrix(c(1:3, 1:3,4:6,1:3),nrow=4,byrow=TRUE)
(doubles(td2))
td3<-matrix(c("d","e","f", rep(c("a","b","cc"),times=3),"g","h","i"),nrow=5,byrow=TRUE)
(doubles(td3))
td4<-matrix(as.logical(td1),nrow=5,byrow=TRUE)
(doubles(td4))



