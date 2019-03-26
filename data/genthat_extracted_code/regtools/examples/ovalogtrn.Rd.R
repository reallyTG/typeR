library(regtools)


### Name: avalogtrn,avalogpred,ovalogtrn,ovalogpred,knntrn,predict.ovaknn
### Title: Classification with More Than 2 Classes
### Aliases: ovalogtrn ovalogpred avalogtrn avalogpred knntrn
###   predict.ovaknn classadjust

### ** Examples


## Not run: 
##D # toy example, kNN
##D set.seed <- 9999
##D x <- runif(25)
##D y <- sample(0:2,25,replace=TRUE)
##D xd <- preprocessx(x,2)
##D kout <- knntrn(y,xd,m=3,k=2)
##D kout$regest  # row 1:  0.5,0.5,0.0
##D predict(kout,matrix(c(0.25,0.55,0.88),ncol=1))  # 2,0,0
##D 
##D # sim data, kNN
##D set.seed <- 9999
##D n <- 1500  
##D # within-grp cov matrix 
##D cv <- rbind(c(1,0.2),c(0.2,1))  
##D xy <- NULL  
##D for (i in 1:3)  
##D    xy <- rbind(xy,rmvnorm(n,mean=rep(i*2.0,2),sigma=cv))  
##D y <- rep(0:2,each=n) 
##D xy <- cbind(xy,y) 
##D xdata <- preprocessx(xy[,-3],20) 
##D oo <- knntrn(y,xdata,m=3,k=20) 
##D predout <- predict(oo,xy[,-3])
##D mean(predout$predy == y)  # about 0.87
##D 
##D \dontrun{
##D library(mlbench)
##D data(Vehicle)
##D xdata <- preprocessx(Vehicle[,-19],25)
##D kout <- knntrn(Vehicle$Class,xdata,k=25)
##D predict(kout,as.matrix(Vehicle[1,-19])) # predicted Y is 3
##D 
##D # UCI Letter Recognition data
##D data(LetterRecognition)
##D # prep data
##D lr <- LetterRecognition
##D # code Y values
##D lr[,1] <- as.numeric(lr[,1]) - 1
##D # training and test sets
##D lrtrn <- lr[1:14000,]
##D lrtest <- lr[14001:20000,]
##D # kNN
##D xdata <- preprocessx(lrtrn[,-1],50)
##D # without setting priors
##D trnout <- knntrn(lrtrn[,1],xdata,26,50)
##D ypred <- predict(trnout,as.matrix(lrtest[,-1]))
##D # how well did it work?
##D mean(ypred$predy == lrtest[,1])  # 0.86
##D # logit
##D ologout <- ovalogtrn(26,lr[,c(2:17,1)])
##D ypred <- ovalogpred(ologout,lr[,-1])
##D mean(ypred == lr[,1])  # only 0.73
##D # try quadratic terms
##D for (i in 2:17)
##D    lr <- cbind(lr,lr[,i]^2)
##D ologout1 <- ovalogtrn(26,lr[,c(2:33,1)])
##D ypred <- ovalogpred(ologout1,lr[,-1])
##D mean(ypred == lr[,1])  # increased to 0.81
##D }
##D 
## End(Not run)




