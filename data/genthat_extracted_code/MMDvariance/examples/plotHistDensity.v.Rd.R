library(MMDvariance)


### Name: plotHistDensity.v
### Title: Plot of histogram and density estimate of the pooled gene
###   expression levels.
### Aliases: plotHistDensity.v
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
     
  
    plotHistDensity.v(obj.gsMMD.v, plotFlag = "case", 
        mytitle = "Histogram (case)", 
        plotComponent = TRUE, 
        x.legend = c(0.8, 3), 
        y.legend = c(0.3, 0.4), 
        numPoints = 50)
    t2=proc.time()-t1
    print(t2)
  




