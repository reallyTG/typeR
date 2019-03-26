
wine <- do.call(
  args = list(),
  what = function(){
    # load the Wine dataset
    data(wine) 
    
    cls <- which(colnames(wine) == "Wine")
    x <- wine[, -cls] # instances without classes
    y <- wine[, cls] # the classes
    x <- scale(x) # scale the attributes for distance calculations
    
    # load partition
    load("winep.RData")
    
    # Data for semi-supervised training
    xtrain <- x[training,]  # training instances
    ytrain <- y[training]   # classes of training instances
    ytrain[unlabeled] <- NA # remove class of unlabeled instances
    
    # Data for supervised training
    xstrain <- xtrain[labeled,]
    ystrain <- ytrain[labeled]
    
    # Data for inductive testing
    xitest <- x[testing,] # testing instances
    yitest <- y[testing]  # classes of instances in xitest
    
    # Data for transductive testing
    xttest <- x[training[unlabeled],] # transductive testing instances
    yttest <- y[training[unlabeled]]  # classes of instances in xttest
    
    # Computing distance matrices
    dtrain <- proxy::dist(x = xtrain, method = "euclidean") %>% as.matrix()
    dstrain <- dtrain[labeled, labeled]
    dttest <- dtrain[unlabeled,]
    ditest <- proxy::dist(x = xitest, y = xtrain, method = "euclidean") %>% as.matrix()
    
    list(xtrain = xtrain, ytrain = ytrain,
         xstrain = xstrain, ystrain = ystrain,
         xitest = xitest, yitest = yitest,
         xttest = xttest, yttest = yttest,
         dtrain = dtrain, dstrain = dstrain,
         ditest = ditest, dttest = dttest)
  }
)
