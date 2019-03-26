library(optpart)


### Name: confus
### Title: Confusion Matrix
### Aliases: confus
### Keywords: htest

### ** Examples

    data(shoshveg) # returns a data frame of vegetation data
    data(shoshsite) # returns a data frame of site data
    library(tree)
    mod <- tree(factor(shoshveg$PSEMEN>0)~ elevation+slope+av,data=shoshsite)
    pred <- predict(mod,newdata=shoshsite)
    confus(shoshveg$PSEMEN>0,pred)



