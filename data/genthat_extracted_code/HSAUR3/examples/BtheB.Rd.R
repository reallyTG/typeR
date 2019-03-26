library(HSAUR3)


### Name: BtheB
### Title: Beat the Blues Data
### Aliases: BtheB
### Keywords: datasets

### ** Examples


  data("BtheB", package = "HSAUR3")
  layout(matrix(1:2, nrow = 1))   
  ylim <- range(BtheB[,grep("bdi", names(BtheB))], na.rm = TRUE)
  boxplot(subset(BtheB, treatment == "TAU")[,grep("bdi", names(BtheB))],
          main = "Treated as usual", ylab = "BDI", 
          xlab = "Time (in months)", names = c(0, 2, 3, 5, 8), ylim = ylim)
  boxplot(subset(BtheB, treatment == "BtheB")[,grep("bdi", names(BtheB))], 
          main = "Beat the Blues", ylab = "BDI", xlab = "Time (in months)",
          names = c(0, 2, 3, 5, 8), ylim = ylim)




