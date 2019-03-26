library(optpart)


### Name: fuzconfus
### Title: Fuzzy Confusion Matrix
### Aliases: fuzconfus
### Keywords: htest

### ** Examples

    data(shoshveg) # returns a data frame of vegetation data
    data(shoshsite) # returns a data frame of site data
    dis.bc <- dsvdis(shoshveg,'bray/curtis')
    opt.5 <- optpart(5,dis.bc)
    library(tree)
    mod <- tree(factor(opt.5$clustering)~ elevation+slope+av,data=shoshsite)
    pred <- predict(mod,newdata=shoshsite)
    fuzconfus(opt.5,pred,dis.bc)



