library(SFtools)


### Name: UfsCov
### Title: UfsCov algorithm for unsupervised feature selection
### Aliases: UfsCov

### ** Examples

infinity<-Infinity(n=800)
Results<- UfsCov(infinity)

cou<-colnames(infinity)
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
##D #### UfsCov on the Butterfly dataset ####
##D require(IDmining)
##D 
##D N <- 1000
##D raw_dat <- Butterfly(N)
##D dat<-raw_dat[,-9]
##D 
##D Results<- UfsCov(dat)
##D cou<-colnames(dat)
##D nom<-cou[Results[[2]]]
##D par(mfrow=c(1,1), mar=c(5,5,2,2))
##D names(Results[[1]])<-cou[Results[[2]]]
##D 
##D plot(Results[[1]] ,pch=16,cex=1,col="blue", axes = FALSE,
##D xlab = "Added Features", ylab = "Coverage measure")
##D lines(Results[[1]] ,cex=2,col="blue")
##D grid(lwd=1.5,col="gray" )
##D box()
##D axis(2)
##D axis(1,1:length(nom),nom)
##D which.min(Results[[1]])
##D 
## End(Not run)



