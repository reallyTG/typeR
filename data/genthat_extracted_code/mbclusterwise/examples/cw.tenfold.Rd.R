library(mbclusterwise)


### Name: cw.tenfold
### Title: F-Fold cross-validation for clusterwise multiblock analyses
### Aliases: cw.tenfold
### Keywords: multivariate cluster

### ** Examples

  data(simdata.red) 
  Data.X <- simdata.red[c(1:8, 21:28), 1:10]
  Data.Y <- simdata.red[c(1:8, 21:28), 11:13]
  res1   <- list()
  res2   <- list()

  ## Note that the options (INIT=2) and (parallel.level = "low") are chosen to quickly
  ## illustrate the function. 
  ## For real data, instead choose (INIT=20) to avoid local optima and (parallel.level = "high")
  ## to improve the computing speed.

  for (H in c(1:2)){
    print(paste("H=", H, sep=""))
    res1[[H]] <- cw.tenfold(Y = Data.Y, X = Data.X, blo = c(5, 5), option = "none", G = 1, H,  
      FOLD = 2, INIT = 2, method = "mbpls", Gamma = NULL, parallel.level = "low")
    res2[[H]] <- cw.tenfold(Y = Data.Y, X = Data.X, blo = c(5, 5), option = "none", G = 2, H,
       FOLD = 2, INIT = 2, method = "mbpls", Gamma = NULL, parallel.level = "low")
  }
  res1.cal <- unlist(lapply(1:2, function(x) mean(sqrt(res1[[x]]$sqrmse.cal), na.rm=TRUE))) 
  res1.val <- unlist(lapply(1:2, function(x) mean(sqrt(res1[[x]]$sqrmse.val), na.rm=TRUE)))
  res2.cal <- unlist(lapply(1:2, function(x) mean(sqrt(res2[[x]]$sqrmse.cal), na.rm=TRUE))) 
  res2.val <- unlist(lapply(1:2, function(x) mean(sqrt(res2[[x]]$sqrmse.val), na.rm=TRUE)))
  
  rmse.cal <- rbind(res1.cal, res2.cal)
  rmse.val <- rbind(res1.val, res2.val)
  rownames(rmse.cal) <- rownames(rmse.val) <- paste("G", 1:2, sep = "=")
  colnames(rmse.cal) <- colnames(rmse.val) <- paste("H", 1:2, sep = "=")

  par(mfrow=c(1,2))
  matplot(t(rmse.cal), type = "o", ylab = "RMSE of calibration", xlab = "Model dimension (H)", 
        main = "Calibration", col = c("steelblue", "darkorange"), pch = c(0, 5), lwd = c(3, 3))
        legend("center", inset = .05, legend = rownames(rmse.cal), pch = c(0, 5), lwd = c(3, 3),
        col = c("steelblue", "darkorange"), horiz = TRUE, title = "Cluster number (G)")
  matplot(t(rmse.val), type = "o", ylab = "RMSE of prediction", xlab = "Model dimension (H)", 
        main = "Prediction", col = c("steelblue", "darkorange"), pch = c(0, 5), lwd = c(3, 3))
        legend("center", inset = .05, legend = rownames(rmse.val), pch = c(0, 5), lwd = c(3, 3), 
        col = c("steelblue", "darkorange"), horiz = TRUE, title = "Cluster number (G)")



