library(seedCCA)


### Name: seedCCA
### Title: Seeded Canonical correlation analysis
### Aliases: seedCCA

### ** Examples

######  data(cookie) ######
data(cookie)
myseq<-seq(141,651,by=2)
X<-as.matrix(cookie[-c(23,61),myseq])
Y<-as.matrix(cookie[-c(23,61),701:704])
dim(X);dim(Y)
selectu(X, Y, case1=TRUE)
seedCCA(X, Y, u1=2, case1=TRUE)

########  data(nutrimouse) ########
data(nutrimouse)
X<-as.matrix(nutrimouse$gene)
Y<-as.matrix(nutrimouse$lipid)
dim(X);dim(Y)
covplot(X, Y, mind=10)
selectu(X, Y, u=10, num.d=4)
seedCCA(X, Y, u1=6, u2=5, num.d=4)



