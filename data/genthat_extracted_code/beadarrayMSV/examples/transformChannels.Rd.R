library(beadarrayMSV)


### Name: transformChannels
### Title: Signal transformation
### Aliases: transformChannels transformSEs

### ** Examples

#Simulate intensity data
X <- matrix(exp(rnorm(4000))*100,nrow=1000,ncol=4,
    dimnames=list(1:1000,paste('Array',1:4)))
Y <- matrix(exp(rnorm(4000))*70,nrow=1000,ncol=4,
    dimnames=list(1:1000,paste('Array',1:4)))

#Transform signal
normOpts <- setNormOptions(offset=0)
trChannel <- transformChannels(X,Y,normOpts)

## Not run: 
##D #Plot one array before and after transformation
##D dev.new()
##D plot(X[,1],Y[,1],pch='o',main='Raw data')
##D dev.new()
##D plot(trChannel$X[,1],trChannel$Y[,1],pch='o',
##D     main=paste(trChannel$lstr,'transformed data'))
## End(Not run)

#Simulate a single bead type represented by 12 beads
beadLevelX <- rnorm(12,mean=800,sd=10) 
sd.X <- sd(beadLevelX)
X <- mean(beadLevelX)
se.X <- sd.X/sqrt(length(beadLevelX))

#Transformed signal (4th-root)
transfX <- mean(beadLevelX^(1/4))   #true value
print(transfX)
transfX.1 <- X^(1/4)                #good approximation
print(transfX.1)

#Transformed standard error (4th-root)
transfSE <- sd(beadLevelX^(1/4))/sqrt(length(beadLevelX))  #true value
print(transfSE)
transfSE.1 <- se.X^(1/4)                                   #bad approximation
print(transfSE.1)
transfSE.2 <- transformSEs(X,se.X,normOpts=normOpts)       #good approximation
print(transfSE.2$SE)



