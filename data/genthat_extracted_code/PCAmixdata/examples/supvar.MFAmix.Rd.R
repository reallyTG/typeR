library(PCAmixdata)


### Name: supvar.MFAmix
### Title: Supplementary variables in MFAmix
### Aliases: supvar.MFAmix

### ** Examples

data(wine)
X.quanti <- splitmix(wine)$X.quanti[,1:5]
X.quali <- splitmix(wine)$X.quali[,1,drop=FALSE]
X.quanti.sup <- splitmix(wine)$X.quanti[,28:29]
X.quali.sup <- splitmix(wine)$X.quali[,2,drop=FALSE]
data <- cbind(X.quanti,X.quali)
data.sup <- cbind(X.quanti.sup,X.quali.sup)
groups <-c(1,2,2,3,3,1)
name.groups <- c("G1","G2","G3")
groups.sup <- c(1,1,2)
name.groups.sup <- c("Gsup1","Gsup2")
mfa <- MFAmix(data,groups,name.groups,ndim=4,rename.level=TRUE,graph=FALSE)
mfa.sup <- supvar(mfa,data.sup,groups.sup,name.groups.sup,rename.level=TRUE)





