library(mobForest)


### Name: mobforest.control-class
### Title: Class '"mobforest.control"' of mobForest model
### Aliases: mobforest.control-class
### Keywords: classes

### ** Examples


# showClass("mobforest.control") The following code creates following forest
# controls: 400 trees to be constructed, sampling with replacement, a node
# contains at least 200 observations
mobforest_controls = mobforest.control(ntree = 400, mtry = 4,
    replace = TRUE, minsplit = 200)




