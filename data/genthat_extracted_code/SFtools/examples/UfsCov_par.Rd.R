library(SFtools)


### Name: UfsCov_par
### Title: UfsCov algorithm for unsupervised feature selection
### Aliases: UfsCov_par

### ** Examples

N <- 800
dat<-Infinity(N)
Results<- UfsCov_par(dat,ncores=2)

cou<-colnames(dat)
nom<-cou[Results[[2]]]
par(mfrow=c(1,1), mar=c(5,5,2,2))
names(Results[[1]])<-cou[Results[[2]]]
plot(Results[[1]] ,pch=16,cex=1,col="blue", axes = FALSE,
xlab = "Added Features", ylab = "Coverage measure")
lines(Results[[1]] ,cex=2,col="blue")
grid(lwd=1.5,col="gray" )
box()
axis(2)
axis(1,1:length(nom),nom)
which.min(Results[[1]])

## Not run: 
##D 
##D N<-5000
##D dat<-Infinity(N)
##D 
##D ## Little comparison:
##D system.time(Uf<-UfsCov(dat))
##D system.time(Uf.p<-UfsCov_par(dat, ncores = 4))
##D 
## End(Not run)



