library(partitionMap)


### Name: partitionMap
### Title: Partition Maps
### Aliases: partitionMap

### ** Examples

	
##---- load Soybean data ----
	data(Soybean)
	X <- Soybean[,-1]
	Y <- Soybean$Y 
	
##---- divide into training and test data ----
	indtrain <- rep(0,nrow(X))
	indtrain[sample(1:length(indtrain), ceiling(nrow(X)/3*2))] <- 1
	XTEST <- X[indtrain==0,]
	YTEST <- Y[indtrain==0]
	X <- X[indtrain==1,]
	Y <- Y[indtrain==1]


##---- compute Partition Map solution ----
	pm <- partitionMap(X,Y,XTEST=XTEST,method="pm",force=TRUE,
                                dimen=2,ntree=80,plottrain=TRUE)


##---- plot the embedded training and test samples ----
	par(mfrow=c(1,3))
	plot(pm$Samples,col=Y,pch=20,cex=1.5,main="Training Data",
                                    xlab="Dimension 1",ylab="Dimension 2")
	points(pm$Rules,pch=".")
	plot(pm$Samplestest,col=YTEST,pch=20,cex=1.5,main="Test Data",
                                     xlab="Dimension 1",ylab="Dimension 2")
	points(pm$Rules,pch=".")
	plot(pm$Samples,col=Y,pch=20,cex=1.5,xlab="",ylab="",type="n",axes=FALSE)
	legend(quantile(pm$Samples[,1],0),quantile(pm$Samples[,2],1),unique(Y),
                              col=1:length(unique(Y)),fill=1:length(unique(Y)),border=0)
	par(mfrow=c(1,1))



