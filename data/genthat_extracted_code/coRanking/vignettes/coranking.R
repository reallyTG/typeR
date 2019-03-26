## ----setup---------------------------------------------------------------
library(knitr)
library(scatterplot3d)
library(Rtsne)
library(coRanking)
npoints <- 1000

theta <- runif(npoints, 0, 2 * pi)
u <- runif(npoints, -1, 0.8)

data <- list()
data$x <- sqrt(1 - u ^ 2) * cos(theta)
data$y <- sqrt(1 - u ^ 2) * sin(theta)
data$z <- u
data$col <-
    rgb(colorRamp(colors = c("red", "yellow", "green"))( (data$z + 1) / 2),
        maxColorValue = 255)
data <- as.data.frame(data, stringsAsFactors = F)

## ---- fig.width = 10, fig.height = 10, out.width = "95%"-----------------
scatterplot3d(data$x, data$y, data$z,
              xlab = "x", ylab = "y", zlab = "z",
              color = data$col)

## ---- fig.show="hold", fig.width = 7, fig.height = 7, out.width = "45%"----
dim.red <- list()
## dim.red$isomap <- isomap(dist(data[c("x","y","z")]), k = 20)
## dim.red$kpca <- kpca(~x + y + z, data)
dim.red$tsne <- Rtsne(data[c("x", "y", "z")])
dim.red$pca <- princomp(data[c("x", "y", "z")])
## plot(dim.red$isomap$points, col = data$col)
## plot(rotated(dim.red$kpca), col = data$col)
plot(dim.red$tsne$Y, col = data$col,
     xlab = "tsne I", ylab = "tsne II",
     main = "t-SNE")
plot(dim.red$pca$scores, col = data$col,
     xlab = "PCA I", ylab = "PCA II",
     main = "PCA")

## ---- fig.show="hold", fig.height = 7, fig.width = 7, out.width = "45%"----
Q.tsne <- coranking(data[c("x", "y", "z")], dim.red$tsne$Y)
Q.pca <- coranking(data[c("x", "y", "z")], dim.red$pca$scores[, 1:2])
imageplot(Q.tsne, main = "t-SNE")
imageplot(Q.pca, main = "PCA")

## ---- fig.show="hold", fig.width = 7, fig.height = 7, out.width = "45%"----
lcmc.tsne <- numeric(nrow(Q.tsne))
lcmc.pca <- numeric(nrow(Q.tsne))
lcmc.tsne <- LCMC(Q.tsne)
lcmc.pca <- LCMC(Q.pca)
Kmax.tsne <- which.max(lcmc.tsne)
Kmax.pca <- which.max(lcmc.pca)
plot(lcmc.tsne, main = "t-SNE", xlab = "K", ylab = "LCMC", type = "l")
plot(lcmc.pca, main = "PCA", xlab = "K", ylab = "LCMC", type = "l")

