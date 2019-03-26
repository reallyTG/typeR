library(mvtboost)


### Name: mvtb
### Title: Fitting a Multivariate Tree Boosting Model
### Aliases: mvtb mvtb.fit

### ** Examples

data(wellbeing)
Y <- wellbeing[,21:26]
X <- wellbeing[,1:20]
Ys <- scale(Y)
cont.id <- unlist(lapply(X,is.numeric))
Xs <- scale(X[,cont.id])

## Fit the model
res <- mvtb(Y=Ys,X=Xs)

## Interpret the model
summary(res)
covex <- mvtb.covex(res, Y=Ys, X=Xs)
plot(res,predictor.no = 8)
predict(res,newdata=Xs)
mvtb.cluster(covex)
mvtb.heat(t(mvtb.ri(res)),cexRow=.8,cexCol=1,dec=0)



