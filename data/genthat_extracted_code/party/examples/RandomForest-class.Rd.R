library(party)


### Name: RandomForest-class
### Title: Class "RandomForest"
### Aliases: RandomForest-class treeresponse,RandomForest-method
###   weights,RandomForest-method where,RandomForest-method
###   show,RandomForest-method
### Keywords: classes

### ** Examples


    set.seed(290875)

    ### honest (i.e., out-of-bag) cross-classification of 
    ### true vs. predicted classes
    data("mammoexp", package = "TH.data")
    table(mammoexp$ME, predict(cforest(ME ~ ., data = mammoexp, 
                               control = cforest_unbiased(ntree = 50)), 
                               OOB = TRUE))



