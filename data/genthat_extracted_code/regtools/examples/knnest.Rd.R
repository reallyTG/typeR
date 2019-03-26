library(regtools)


### Name: knnest,meany,vary,loclin,predict.knn,preprocessx,kmin,parvsnonparplot,nonparvsxplot,l1,l2
### Title: Nonparametric Regression and Classification
### Aliases: knnest predict.knn meany vary loclin preprocessx kmin
###   parvsnonparplot nonparvsxplot nonparvarplot l2 l1

### ** Examples

set.seed(9999)
x <- matrix(sample(1:100,30),ncol=3)
xd <- preprocessx(x[,1],2,TRUE)  # just 1 predictor
ko <- knnest(x[,2],xd,2)  # Y is x[,2]
ko$regest # 1st element = 74.5
predict(ko,matrix(76))  # 47.5
ko <- knnest(x[,-1],xd,2)  # Y bivar
ko$regest # 1st row = (74.5,31.5)
predict(ko,matrix(76))  # 47.5, 65.0

xe <- matrix(rnorm(30000),ncol=3) 
xe[,-3] <- xe[,-3] + 2 
# xe is 2 predictors and epsilon 
y <- xe %*% c(1,0.5,0.2)  # Y
x <- xe[,-3]  # X
xdata <- preprocessx(x,500)  # k as high as 500
zout <- knnest(y,xdata,200) 
predict(zout,matrix(c(1,1),nrow=1))  # about 1.55

## Not run: 
##D data(prgeng)
##D pe <- prgeng
##D # dummies for MS, PhD
##D pe$ms <- as.integer(pe$educ == 14)
##D pe$phd <- as.integer(pe$educ == 16)
##D # computer occupations only
##D pecs <- pe[pe$occ >= 100 & pe$occ <= 109,]
##D # for simplicity, let's choose a few predictors
##D pecs1 <- pecs[,c(1,7,9,12,13,8)]
##D # will predict wage income from age, gender etc.
##D # prepare nearest-neighbor data, k up to 50
##D xdata <- preprocessx(pecs1[,1:5],50)
##D zout <- knnest(pecs1[,6],xdata,50)  # k = 50
##D # find the est. mean income for 42-year-old women, 52 weeks worked, with
##D # a Master's
##D predict(zout,matrix(c(42,2,52,0,0),nrow=1))  # 62106
##D # try k = 25; don't need to call preprocessx() again
##D zout <- knnest(pecs1[,6],xdata,25)
##D predict(zout,matrix(c(42,2,52,0,0),nrow=1))  # 69104
##D # quite a difference; what k values are good?
##D kmin(pecs1[,6],xdata) # at least 50
##D # what about a man?
##D zout <- knnest(pecs1[,6],xdata,50)
##D predict(zout,matrix(c(42,1,52,0,0),nrow=1))  # 78588
##D # form training and test sets, fit on the former and predict on the
##D # latter
##D fullidxs <- 1:nrow(pecs1)
##D train <- sample(fullidxs,10000)
##D xdata <- preprocessx(pecs1[train,1:5],50)
##D trainout <- knnest(pecs1[train,6],xdata,50)
##D testout <- predict(trainout,as.matrix(pecs1[-train,-6]))
##D # find mean abs. prediction error (about $25K)
##D mean(abs(pecs1[-train,6] - testout))
##D # examples of fit assessment
##D # look for nonlinear relations between Y and each X
##D nonparvsxplot(zout)  # keep hitting Enter for next plot
##D # there seem to be quadratic relations with age and wkswrkd, so add quad
##D # terms and run lm()
##D pecs2 <- pecs1 
##D pecs2$age2 <- pecs1$age^2 
##D pecs2$wks2 <- pecs1$wkswrkd^2 
##D lmout2 <- lm(wageinc ~ .,data=pecs2) 
##D # check parametric fit by comparing to kNN
##D parvsnonparplot(lmout2,zout) 
##D # linear model line somewhat faint, due to large n;
##D # parametric model seems to overpredict at high end;
##D # to deal with faintness, reduce size of points
##D parvsnonparplot(lmout2,zout,cex=0.1) 
##D # assess homogeneity of conditional variance
##D nonparvarplot(zout) 
##D # hockey stick!
## End(Not run)

# Y vector-valued (3 classes)
# 3 clusters, equal wts, coded 0,1,2
n <- 1500 
# within-grp cov matrix
cv <- rbind(c(1,0.2),c(0.2,1)) 
xy <- NULL 
for (i in 1:3) 
   xy <- rbind(xy,rmvnorm(n,mean=rep(i*2.0,2),sigma=cv)) 
y <- rep(0:2,each=n)
xy <- cbind(xy,dummy(y))
xdata <- preprocessx(xy[,-(3:5)],20) # X is xy[,1:2], k <= 20
ko <- knnest(xy[,3:5],xdata,20) 
# find predicted Y for each data pt 
mx <- apply(as.matrix(ko$regest),1,which.max) - 1
# overall correct classification rate
mean(mx == y)  # should be about 0.87




