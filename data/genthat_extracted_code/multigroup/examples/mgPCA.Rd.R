library(multigroup)


### Name: mgPCA
### Title: Multigroup Principal Component Analysis
### Aliases: mgPCA

### ** Examples

Data = iris[,-5]
Group = iris[,5]
res.mgPCA = mgPCA (Data, Group)
barplot(res.mgPCA$noncumper.inertiglobal)
#----------------
#Similarity index: group loadings are compared to the common structure (first dimension)
Xzero = rep(0, 3)
MIN = min(res.mgPCA$Similarity.noncum.Common.Group.load[[1]][-1, 1])-0.0005
XLAB = paste("Dim1, %",res.mgPCA$noncumper.inertiglobal[1])
plot(Xzero, res.mgPCA$Similarity.noncum.Common.Group.load[[1]][-1, 1], pch=15, ylim=c(MIN, 1),
main="Similarity between groups and common structure", xlab=XLAB, ylab="", xaxt="n")
abline(v=0)
abline(h=seq(MIN, 1, by=0.05), col="black", lty=3)
XX=res.mgPCA$Similarity.noncum.Common.Group.load[[1]][-1, 1, drop=FALSE]
text(Xzero, XX, labels=rownames(XX), pos=4)
#----------------
# Similarity index: group loadings are compared to the common structure (dimensions 1 and 2)
XX1=res.mgPCA$Similarity.noncum.Common.Group.load[[1]][-1, 1]
XX2=res.mgPCA$Similarity.noncum.Common.Group.load[[2]][-1, 1]
simil <- cbind(XX1, XX2)
YLAB = paste("Dim1, %",res.mgPCA$noncumper.inertiglobal[2])
plot(simil, xlab=XLAB, ylab=YLAB, main="Similarity between groups and common structure", pch=20)
text(simil, labels=rownames(simil), cex=1, font.lab=1, pos=3)
#------------------
loadingsplot(res.mgPCA, axes=c(1,2), INERTIE=res.mgPCA$noncumper.inertiglobal)
scoreplot(res.mgPCA, axes=c(1,2))



