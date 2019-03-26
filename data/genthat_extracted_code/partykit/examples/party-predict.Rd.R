library(partykit)


### Name: party-predict
### Title: Tree Predictions
### Aliases: party-predict predict.party predict_party
###   predict_party.default predict_party.constparty
###   predict_party.simpleparty
### Keywords: tree

### ** Examples


  ## fit tree using rpart
  library("rpart")
  rp <- rpart(skips ~ Opening + Solder + Mask + PadType + Panel,
              data = solder, method = 'anova')

  ## coerce to `constparty'
  pr <- as.party(rp)

  ## mean predictions
  predict(pr, newdata = solder[c(3, 541, 640),])

  ## ecdf
  predict(pr, newdata = solder[c(3, 541, 640),], type = "prob")

  ## terminal node identifiers
  predict(pr, newdata = solder[c(3, 541, 640),], type = "node")

  ## median predictions
  predict(pr, newdata = solder[c(3, 541, 640),], 
          FUN = function(y, w = 1) median(y))




