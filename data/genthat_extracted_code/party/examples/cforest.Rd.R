library(party)


### Name: cforest
### Title: Random Forest
### Aliases: cforest proximity
### Keywords: tree

### ** Examples


    set.seed(290875)

    ### honest (i.e., out-of-bag) cross-classification of
    ### true vs. predicted classes
    data("mammoexp", package = "TH.data")
    table(mammoexp$ME, predict(cforest(ME ~ ., data = mammoexp, 
                               control = cforest_unbiased(ntree = 50)),
                               OOB = TRUE))

    ### fit forest to censored response
    if (require("TH.data") && require("survival")) {

        data("GBSG2", package = "TH.data")
        bst <- cforest(Surv(time, cens) ~ ., data = GBSG2, 
                   control = cforest_unbiased(ntree = 50))

        ### estimate conditional Kaplan-Meier curves
        treeresponse(bst, newdata = GBSG2[1:2,], OOB = TRUE)

        ### if you can't resist to look at individual trees ...
        party:::prettytree(bst@ensemble[[1]], names(bst@data@get("input")))
    }

    ### proximity, see ?randomForest
    iris.cf <- cforest(Species ~ ., data = iris, 
                       control = cforest_unbiased(mtry = 2))
    iris.mds <- cmdscale(1 - proximity(iris.cf), eig = TRUE)
    op <- par(pty="s")
    pairs(cbind(iris[,1:4], iris.mds$points), cex = 0.6, gap = 0, 
          col = c("red", "green", "blue")[as.numeric(iris$Species)],
          main = "Iris Data: Predictors and MDS of Proximity Based on cforest")
    par(op)




