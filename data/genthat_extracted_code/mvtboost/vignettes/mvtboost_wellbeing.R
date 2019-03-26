## ----eval=TRUE-----------------------------------------------------------
#install.packages("mvtboost")
library(mvtboost)
data(wellbeing)

Y <- wellbeing[,21:26]
X <- wellbeing[,1:20]
Ys <- scale(Y)
ynames <- c("Autonomy","Environmental Mastery","Personal Growth","Positive Relationships","Purpose in Life","Self Acceptance")
xnames <- c("Gender","Age","Income","Education","Chronic Health","Somatic Health","Self Report Health","Positive Affect","Negative Affect","Perceived Social Control","Control Internal States","Commitment","Control","Challenge","Ego Resilience","Social Support - Friends","Social Support - Family","Stress-Problems","Stress-Emotions","Loneliness")
cont.id <- unlist(lapply(X,is.numeric))
Xs <- X
Xs[,cont.id] <- scale(X[,cont.id])
colnames(Xs) <- xnames
colnames(Ys) <- ynames
res <- mvtb(Y=Ys,X=Xs)

## ----echo=FALSE, eval=FALSE----------------------------------------------
#  # tuning the model
#  
#  res5 <- mvtb(Y=Ys,X=Xs,n.trees=1000,shrinkage=.05,cv.folds=5,compress=FALSE)
#  res5train <- mvtb(Y=Ys,X=Xs,n.trees=1000,shrinkage=.05,cv.folds=5,compress=FALSE,s=trainset)
#  save(res5,file="vignettes/wb_cv5.Rdata")
#  save(res5train,file="vignettes/wb_cv5test.Rdata")

## ----eval=FALSE----------------------------------------------------------
#  res5 <- mvtb(Y=Ys,X=Xs,n.trees=1000,shrinkage=.05,cv.folds=5,compress=FALSE)

## ------------------------------------------------------------------------
set.seed(104)
trainset <- sample(1:nrow(Ys),size = 784,replace=FALSE)

## ----eval=FALSE----------------------------------------------------------
#  res5train <- mvtb(Y=Ys,X=Xs,n.trees=1000,shrinkage=.05,cv.folds=5,compress=FALSE,s=trainset)

## ----eval=FALSE----------------------------------------------------------
#  res5$best.trees
#  summary(res5)

## ----echo=FALSE----------------------------------------------------------
load("wb_cv5.Rdata")
load("wb_cv5test.Rdata")
res5$best.trees

## ----echo=FALSE,fig.height=7,fig.width=7---------------------------------
plot(x=1:1000,y=res5$trainerr,type="l",ylab="Error",xlab="Number of trees")
abline(v=res5$best.trees$best.cv)
lines(x=1:1000,y=res5$cv.err,type="l",col="red")
legend("topright",legend=c("Training Error","Cross-Validation Error"),lty=c(1,1),col=c("black","red"),bty="n")

## ----eval=FALSE----------------------------------------------------------
#  summary(res5)
#  round(mvtb.ri(res5,relative = "tot"),2)

## ----fig.height=5,fig.width=10-------------------------------------------
numformat <- function(val){sub("^(-?)0.", "\\1.", sprintf("%.1f", val))}
  
par(mar=c(8,10,1,1))
mvtb.heat(t(mvtb.ri(res5)),clust.method = NULL,cexRow=1,cexCol=1,numformat=numformat)

## ------------------------------------------------------------------------
testset <- (1:nrow(Ys))[!(1:nrow(Ys) %in% trainset)]
yhat <- predict(res5train,newdata=Xs[testset,])
diag(var(yhat)/var(Ys[testset,]))

## ----fig.height=5,fig.width=10-------------------------------------------
par(mar=c(8,15,1,1),mfrow=c(1,1))
numformat <- function(val){sub("^(-?)0.", "\\1.", sprintf("%.2f", val))}
covex <- mvtb.covex(res5, Y=Ys, X=Xs)
mvtb.heat(covex[,-c(1:7)],cexRow=.9,numformat=numformat,clust.method = NULL)


## ----eval=FALSE----------------------------------------------------------
#  mvtb.cluster(covex)

## ----fig.height=5,fig.width=10-------------------------------------------
par(mar=c(8,12,1,1),mfrow=c(1,1))
mvtb.heat(covex[,-c(1:7)],cexRow=.9)

## ----fig.height=5,fig.width=12-------------------------------------------
par(mfcol=c(1,2),mar=c(5,5,4,1))
plot(res5,predictor.no=11,response.no=3,ylim=c(-1,1.5)) # persgrwth on cis
text(-4,1.825,labels="A",xpd=TRUE)
mvtb.perspec(res5,predictor.no=c(11,18),response.no=6)
text(-.5,.5,labels="B",xpd=TRUE)

## ----echo=FALSE,eval=FALSE-----------------------------------------------
#  res.nl <- mvtb.nonlin(res5,Y=Ys,X=Xs)
#  save(res.nl,file="wb_nonlin.Rdata")

## ----eval=FALSE----------------------------------------------------------
#  res.nl <- mvtb.nonlin(res5,Y=Ys,X=Xs)

## ----echo=FALSE----------------------------------------------------------
load(file="wb_nonlin.Rdata")

## ------------------------------------------------------------------------
lapply(res.nl,function(r){head(r[[1]])})

