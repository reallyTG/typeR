library(VineCopula)


### Name: pairs.copuladata
### Title: Pairs Plot of Copula Data
### Aliases: pairs.copuladata

### ** Examples


data(daxreturns)
## Don't show: 
daxreturns <- daxreturns[1:50, ]
## End(Don't show)
data <- as.copuladata(daxreturns)
sel <- c(4,5,14,15)

## pairs plot with default settings
pairs(data[sel])

## pairs plot with custom settings
nlevels <- 20
pairs(data[sel], cex = 2, pch = 1, col = "black",
      diag.panel = NULL, label.pos = 0.5,
      cex.labels = 2.5, gap = 1,
      method = "pearson", ccols = heat.colors(nlevels),
      margins = "flexp")

## pairs plot with own panel functions
up <- function(x, y) {
  # upper panel: empirical contour plot
  op <- par(usr = c(-3, 3, -3, 3), new = TRUE)
  BiCopKDE(x, y,
           levels = c(0.01, 0.05, 0.1, 0.15, 0.2),
           margins = "exp",
           axes = FALSE)
  on.exit(par(op))
}

lp <- function(x, y) {
  # lower panel: scatter plot (copula data) and correlation
  op <- par(usr = c(0, 1, 0, 1), new = TRUE)
  points(x, y, pch = 1, col = "black")
  r <- cor(x, y, method = "spearman") # Spearman's rho
  txt <- format(x = r, digits = 3, nsmall = 3)[1]
  text(x = 0.5, y = 0.5, labels = txt, cex = 1 + abs(r) * 2, col = "blue")
  on.exit(par(op))
}

dp <- function(x) {
  # diagonal panel: histograms (copula data)
  op <- par(usr = c(0, 1, 0, 1.5), new = TRUE)
  hist(x, freq = FALSE, add = TRUE, col = "brown", border = "black", main = "")
  abline(h = 1, col = "black", lty = 2)
  on.exit(par(op))
}

nlevels <- 20
pairs(data[sel],
      lower.panel = lp, upper.panel = up, diag.panel = dp, gap = 0.5)




