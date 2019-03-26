library(ChemoSpec2D)


### Name: miaSpectra2D
### Title: Multivariate Image Analysis (Tucker 1) of a Spectra2D Object
### Aliases: miaSpectra2D
### Keywords: multivariate

### ** Examples


data(MUD1)
res <- miaSpectra2D(MUD1)
plotScores(MUD1, res, main = "MIA Scores", tol = 0.1, ellipse = "cls")
plotScree(res)
MUD1a <- miaLoadings(MUD1, res, load_lvls = c(-0.4, -0.2, 0.2, 0.4),
  main = "MIA Comp. 1 Loadings")

# Selection of loading matrix levels can be aided by the following

inspectLvls(MUD1a, loadings = TRUE, ylim = c(0, 10),
  main = "Histogram of Loadings Matrix")




