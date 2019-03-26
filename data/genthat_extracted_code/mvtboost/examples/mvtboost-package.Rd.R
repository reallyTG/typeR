library(mvtboost)


### Name: mvtboost-package
### Title: Tree Boosting for Multivariate Outcomes
### Aliases: mvtboost-package mvtboost
### Keywords: Boosting, multivariate responses

### ** Examples

data(wellbeing)
Y <- wellbeing[,21:26]
X <- wellbeing[,1:20]
Ys <- scale(Y)
cont.id <- unlist(lapply(X,is.numeric))
Xs <- scale(X[,cont.id])

res <- mvtb(Y=Ys,X=Xs)

summary(res)
plot(res,predictor.no = 8)
predict(res,newdata=Xs)

covex <- mvtb.covex(res, Y=Ys, X=Xs)
mvtb.cluster(covex)
par(mar=c(4,7,1,1))
mvtb.heat(covex,cexRow=.8)
par(mar=c(5,5,1,1))
mvtb.heat(t(mvtb.ri(res)),cexRow=.8,cexCol=1,dec=0)



