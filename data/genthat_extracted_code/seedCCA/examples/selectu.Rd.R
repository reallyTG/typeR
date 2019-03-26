library(seedCCA)


### Name: selectu
### Title: Function that guide the selection of the terminating index when
###   using seedCCA function
### Aliases: selectu

### ** Examples

######  data(cookie) ######
data(cookie)
myseq<-seq(141,651,by=2)
X<-as.matrix(cookie[-c(23,61),myseq])
Y<-as.matrix(cookie[-c(23,61),701:704])
selectu(X, Y, case1=TRUE) ## nFu1 returned
selectu(Y, X, case1=TRUE) ## the same as selectu(X, Y, case1=TRUE), but nFu2 reuturned.

selectu(X, Y, u=10, case1=TRUE)


########  data(nutrimouse) ########
data(nutrimouse)
Y<-as.matrix(nutrimouse$lipid)
X<-as.matrix(nutrimouse$gene)
selectu(X, Y, u=10, num.d=4)



