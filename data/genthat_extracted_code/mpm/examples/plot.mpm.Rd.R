library(mpm)


### Name: plot.mpm
### Title: Spectral Map Plot of Multivariate Data...
### Aliases: plot.mpm
### Keywords: multivariate hplot

### ** Examples
# Weighted spectral map analysis
data(Golub) # Gene expression data of leukemia patients
data(Golub.grp) # Pathological classes coded as 1, 2, 3
r.sma <- mpm(Golub[,1:39], row.weight = "mean", col.weight = "mean")
# Spectral map biplot with result
r <- plot(r.sma, label.tol = 20, scale = "uvc",
col.group = (Golub.grp)[1:38], zoom = c(1,1.2), col.size = 5)
Golub[r$Rows$Select, 1] # 20 most extreme genes


