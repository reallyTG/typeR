library(UBL)


### Name: RandUnderClassif
### Title: Random under-sampling for imbalanced classification problems
### Aliases: RandUnderClassif
### Keywords: pre-processing classification

### ** Examples

  library(DMwR)
  data(algae)
  C.perc = list(autumn = 1, summer = 0.9, winter = 0.4) 
  # classes autumn and spring remain unchanged
  
  myunder.algae <- RandUnderClassif(season~., algae, C.perc)
  undBalan.algae <- RandUnderClassif(season~., algae, "balance")
  undInvert.algae <- RandUnderClassif(season~., algae, "extreme")

  library(MASS)
  data(cats)
  myunder.cats <- RandUnderClassif(Sex~., cats, list(M = 0.8))
  undBalan.cats <- RandUnderClassif(Sex~., cats, "balance")
  undInvert.cats <- RandUnderClassif(Sex~., cats, "extreme")


  # learn a model and check results with original and under-sampled data
  library(rpart)
  idx <- sample(1:nrow(cats), as.integer(0.7*nrow(cats)))
  tr <- cats[idx, ]
  ts <- cats[-idx, ]
  
  idx <- sample(1:nrow(cats), as.integer(0.7*nrow(cats)))
  tr <- cats[idx, ]
  ts <- cats[-idx, ]
  ctO <- rpart(Sex ~ ., tr)
  predsO <- predict(ctO, ts, type = "class")
  new.cats <- RandUnderClassif(Sex~., tr, "balance")
  ct1 <- rpart(Sex ~ ., new.cats)
  preds1 <- predict(ct1, ts, type = "class")
   
  table(predsO, ts$Sex)  
#  predsO  F  M
#      F  9  3
#      M  7 25


  table(preds1, ts$Sex)   
# preds1  F  M
#      F 13  4
#      M  3 24




