library(UBL)


### Name: SmoteRegress
### Title: SMOTE algorithm for imbalanced regression problems
### Aliases: SmoteRegress
### Keywords: pre-processing regression

### ** Examples


  ir <- iris[-c(95:130), ]
  mysmote1.iris <- SmoteRegress(Sepal.Width~., ir, dist = "HEOM",
                                C.perc=list(0.5,2.5))
  mysmote2.iris <- SmoteRegress(Sepal.Width~., ir, dist = "HEOM",
                                C.perc = list(0.2, 4), thr.rel = 0.8)
  smoteBalan.iris <- SmoteRegress(Sepal.Width~., ir, dist = "HEOM",
                                C.perc = "balance")
  smoteExtre.iris <- SmoteRegress(Sepal.Width~., ir, dist = "HEOM",
                                C.perc = "extreme")
  
  # checking visually the results 
  plot(sort(ir$Sepal.Width))
  plot(sort(smoteExtre.iris$Sepal.Width))
  
  # using a relevance function provided by the user
  rel <- matrix(0, ncol = 3, nrow = 0)
  rel <- rbind(rel, c(2, 1, 0))
  rel <- rbind(rel, c(3, 0, 0))
  rel <- rbind(rel, c(4, 1, 0))

  sP.ir <- SmoteRegress(Sepal.Width~., ir, rel = rel, dist = "HEOM",
                        C.perc = list(4, 0.5, 4))




