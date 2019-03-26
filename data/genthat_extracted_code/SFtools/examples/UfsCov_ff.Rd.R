library(SFtools)


### Name: UfsCov_ff
### Title: UfsCov for unsupervised features selection
### Aliases: UfsCov_ff

### ** Examples


## Not run: 
##D #### Infinity dataset ####
##D N <- 1000
##D dat<-Infinity(N)
##D Results<- UfsCov_ff(dat)
##D 
##D cou<-colnames(dat)
##D nom<-cou[Results[[2]]]
##D par(mfrow=c(1,1), mar=c(5,5,2,2))
##D names(Results[[1]])<-cou[Results[[2]]]
##D plot(Results[[1]] ,pch=16,cex=1,col="blue", axes = FALSE,
##D xlab = "Added Features", ylab = "Coverage measure")
##D lines(Results[[1]] ,cex=2,col="blue")
##D grid(lwd=1.5,col="gray" )
##D box()
##D axis(2)
##D axis(1,1:length(nom),nom)
##D which.min(Results[[1]])
##D 
##D #### Butterfly dataset ####
##D 
##D require(IDmining)
##D N <- 1000
##D raw_dat <- Butterfly(N)
##D dat<-raw_dat[,-9]
##D 
##D Results<- UfsCov_ff(dat)
##D 
## End(Not run)



