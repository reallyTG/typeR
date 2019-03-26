library(mclust)


### Name: plot.MclustDR
### Title: Plotting method for dimension reduction for model-based
###   clustering and classification
### Aliases: plot.MclustDR plotEvalues.MclustDR
### Keywords: multivariate

### ** Examples

mod <- Mclust(iris[,1:4], G = 3)
dr <- MclustDR(mod)
plot(dr, what = "evalues")
plot(dr, what = "pairs")
plot(dr, what = "scatterplot", dimens = c(1,3))
plot(dr, what = "contour")
plot(dr, what = "classification", ngrid = 200)
plot(dr, what = "boundaries", ngrid = 200)
plot(dr, what = "density")
plot(dr, what = "density", dimens = 2)

data(banknote)
da <- MclustDA(banknote[,2:7], banknote$Status, G = 1:3)
dr <- MclustDR(da)
plot(dr, what = "evalues")
plot(dr, what = "pairs")
plot(dr, what = "contour")
plot(dr, what = "contour", dimens = c(1,3))
plot(dr, what = "classification", ngrid = 200)
plot(dr, what = "boundaries", ngrid = 200)
plot(dr, what = "density")
plot(dr, what = "density", dimens = 2)



