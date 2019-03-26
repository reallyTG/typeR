library(ChemoSpec2D)


### Name: pfacSpectra2D
### Title: PARAFAC Analysis of a Spectra2D Object
### Aliases: pfacSpectra2D
### Keywords: multivariate

### ** Examples


data(MUD1)
set.seed(123)
res <- pfacSpectra2D(MUD1, parallel = FALSE, nfac = 2)
plotScores(MUD1, res, tol = 0.1, leg.loc = "topright",
  ellipse = "cls", main = "PARAFAC Score Plot")
res1 <- pfacLoadings(MUD1, res,
  load_lvls = seq(-12, -2, 2),
  main = "PARAFAC Comp. 1 Loadings")
res2 <- pfacLoadings(MUD1, res, load_lvls = seq(-12, -2, 2),
  ref = 2, ref_lvls = c(-0.2, -0.1, 0.1, 0.2),
  ref_cols = c("violet", "violet", "orange", "orange"),
  main = "PARAFAC Comp. 1 Loadings + Ref. Spectrum")

# Selection of loading matrix levels can be aided by the following

inspectLvls(res1, loadings = TRUE, ylim = c(0, 50),
  main = "Histogram of Loadings Matrix")




