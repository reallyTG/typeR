library(MMDvariance)


### Name: gsMMD.v
### Title: Gene selection based on variances by using a mixture of marginal
###   distributions
### Aliases: gsMMD.v
### Keywords: classif

### ** Examples

      t1 = proc.time()
      library(ALL)
      data(ALL)
      eSet1 <- ALL[1:50, ALL$BT == "B3" | ALL$BT == "T2"]
      
      mem.str <- as.character(eSet1$BT)
      nSubjects <- length(mem.str)
      memSubjects <- rep(0,nSubjects)
      # B3 coded as 0, T2 coded as 1
      memSubjects[mem.str == "T2"] <- 1
      
      obj.gsMMD.v <- gsMMD.v(eSet1, memSubjects, transformFlag = FALSE, 
        transformMethod = "boxcox", scaleFlag = FALSE, 
        eps = 1.0e-1, ITMAX = 5, quiet = TRUE)
      print(round(obj.gsMMD.v$para, 3))
      t2=proc.time()-t1
      print(t2)
      



