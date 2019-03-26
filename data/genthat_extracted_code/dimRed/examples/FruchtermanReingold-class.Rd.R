library(dimRed)


### Name: FruchtermanReingold-class
### Title: Fruchterman Reingold Graph Layout
### Aliases: FruchtermanReingold-class FruchtermanReingold

### ** Examples

dat <- loadDataSet("Swiss Roll", n = 100)

## use the S4 Class directly:
fruchterman_reingold <- FruchtermanReingold()
pars <- fruchterman_reingold@stdpars
pars$knn <- 5
emb <- fruchterman_reingold@fun(dat, pars)

## simpler, use embed():
emb2 <- embed(dat, "FruchtermanReingold", knn = 5)

plot(emb, type = "2vars")




