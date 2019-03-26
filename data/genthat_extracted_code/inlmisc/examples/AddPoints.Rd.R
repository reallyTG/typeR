library(inlmisc)


### Name: AddPoints
### Title: Add Points to Plot
### Aliases: AddPoints
### Keywords: hplot

### ** Examples

set.seed(2)

n <- 50L
x <- cbind(runif(n, 1, 10), runif(n, 1, 500))
z <- runif(n, 0, 1000)
z[sample.int(n, 2)] <- 0
AddPoints(x, z = z, fg = "#00000080", lwd = 0.5, title = "Title",
          subtitle = "Subtitle", add = FALSE)

idxs <- sample.int(n, floor(n / 2))
z[idxs] <- -z[idxs]
AddPoints(x, z = z, bg.neg = "#2A8FBDCB", breaks = pretty(z, n = 8),
          legend.loc = "bottomleft", add = FALSE)

Pal1 <- colorRampPalette(c("#CA0020CB", "#F4A582CB"), alpha = TRUE)
Pal2 <- colorRampPalette(c("#0571B0CB", "#92C5DECB"), alpha = TRUE)
AddPoints(x, z = z, bg = Pal1, bg.neg = Pal2, add = FALSE)

AddPoints(x, z = z, bg = Pal1, bg.neg = Pal2, add = FALSE, make.intervals = TRUE)

AddPoints(x, z = z, bg = Pal1, bg.neg = Pal2, add = FALSE, make.intervals = TRUE,
          inches = 0.1)

AddPoints(x, z = abs(z), title = "Quantiles", bg = topo.colors,
          quantile.breaks = TRUE, add = FALSE)

z <- as.factor(rep(c("dog", "cat", "ant", "pig", "bat"), length.out = n))
bg <- GetColors(nlevels(z), scheme = "bright", alpha = 0.8)
AddPoints(x, z = z, bg = bg, add = FALSE)

AddPoints(x, draw.legend = FALSE, add = FALSE)




