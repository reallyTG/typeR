library(UBL)


### Name: RandOverClassif
### Title: Random over-sampling for imbalanced classification problems
### Aliases: RandOverClassif
### Keywords: pre-processing classification

### ** Examples

  library(DMwR)
  data(algae)
  # classes spring and winter remain unchanged
  C.perc = list(autumn = 2, summer = 1.5, spring = 1) 
  myover.algae <- RandOverClassif(season~., algae, C.perc)
  oveBalan.algae <- RandOverClassif(season~., algae, "balance")
  oveInvert.algae <- RandOverClassif(season~., algae, "extreme")
  
  library(MASS)
  data(cats)
  myover.cats <- RandOverClassif(Sex~., cats, list(M = 1.5))
  oveBalan.cats <- RandOverClassif(Sex~., cats, "balance")
  oveInvert.cats <- RandOverClassif(Sex~., cats, "extreme")
  
  # learn a model and check results with original and over-sampled data
  library(rpart)
  idx <- sample(1:nrow(cats), as.integer(0.7 * nrow(cats)))
  tr <- cats[idx, ]
  ts <- cats[-idx, ]
  
  ctO <- rpart(Sex ~ ., tr)
  predsO <- predict(ctO, ts, type = "class")
  new.cats <- RandOverClassif(Sex~., tr, "balance")
  ct1 <- rpart(Sex ~ ., new.cats)
  preds1 <- predict(ct1, ts, type = "class")
  table(predsO, ts$Sex)   
  table(preds1, ts$Sex)



