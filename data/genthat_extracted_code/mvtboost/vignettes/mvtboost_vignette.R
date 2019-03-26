## ------------------------------------------------------------------------
library(mvtboost)
data("mpg",package="ggplot2")
Y <- mpg[,c("cty","hwy")]      # use both city and highway mileage as dvs
Ys <- scale(Y)                 # recommended that outcomes are on same scale
X <- mpg[,-c(2,8:9)]           # manufacturer, displacement, year, cylinder, transmission,drive, class
char.ids <- unlist(lapply(X,is.character))
X[,char.ids] <- lapply(X[,char.ids],as.factor)

out <- mvtb(Y=Ys,X=X,          # data
        n.trees=1000,          # number of trees
        shrinkage=.01,         # shrinkage or learning rate
        interaction.depth=3)   # tree or interaction depth

## ------------------------------------------------------------------------
out2 <- mvtb(Y=Ys,X=X,
            n.trees=1000, 
            shrinkage=.01,
            interaction.depth=3,
            
            bag.fraction=.5,      # fit each tree to a sub sample of this fraction
            train.fraction=.5,    # only fit the model to this fraction of the data set
            cv.folds=3,           # number of cross-validation folds
            mc.cores=1,           # run the cross-validation in parallel
            seednum=103)          # set the seed number for reproducibility
out2$best.trees

## ------------------------------------------------------------------------
summary(out)
summary(out2)

## ------------------------------------------------------------------------
yhat <- predict(out2,newdata=X)
(r2 <- var(yhat)/var(Ys))

## ----fig.width=8,fig.height=3.5------------------------------------------
par(mfcol=c(1,2))              # model implied effects for predictor 2 for cty and hwy
plot(out2,response.no=1,predictor.no=2,ylim=c(-1,1))
plot(out2,response.no=2,predictor.no=2,ylim=c(-1,1))

## ----fig.height=6,fig.width=6--------------------------------------------
mvtb.perspec(out2,response.no = 1,predictor.no = c(2,8),xlab="displacement",ylab="class",theta=45,zlab="cty")

## ------------------------------------------------------------------------
nonlin.out <- mvtb.nonlin(out2,X=X,Y=Y)
nonlin.out$hwy$rank.list
nonlin.out$cty$rank.list


## ------------------------------------------------------------------------
covex <- mvtb.covex(out2, Y=Ys, X=X)
round(covex,2)

## ----fig.width=8---------------------------------------------------------
cc <- mvtb.cluster(covex, clust.method = "ward.D", dist.method = "manhattan")
round(cc,2)
mvtb.heat(covex)

