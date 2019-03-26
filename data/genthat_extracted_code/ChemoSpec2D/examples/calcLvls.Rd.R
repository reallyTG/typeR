library(ChemoSpec2D)


### Name: calcLvls
### Title: Calculate Levels for Contour and Image Type Plots
### Aliases: calcLvls
### Keywords: utilities

### ** Examples


set.seed(9)
MM <- matrix(runif(100, -1, 1), nrow = 10) # test data
tsts <- c("even", "log", "poslog", "exp", "posexp", "ecdf", "NMR")
for (i in 1:length(tsts)) {
	nl <- 10
	if(tsts[i] == "ecdf")  nl <- seq(0.1, 0.9, 0.1)
	levels <- calcLvls(M = MM, n = nl, mode = tsts[i],
   showHist = TRUE, main = tsts[i])
	}





