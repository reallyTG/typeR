## ---- dpi = 66, message = FALSE------------------------------------------
library(propr)
data(iris)
keep <- iris$Species %in% c("setosa", "versicolor")
counts <- iris[keep, 1:4] * 10
group <- ifelse(iris[keep, "Species"] == "setosa", "A", "B")
pd <- propd(counts, group, alpha = NA, p = 100)

## ---- dpi = 66, message = FALSE------------------------------------------
theta_d <- setDisjointed(pd)
theta_e <- setEmergent(pd)

## ---- dpi = 66-----------------------------------------------------------
theta_d <- updateCutoffs(theta_d, cutoff = seq(0.05, 0.95, 0.3))
theta_e <- updateCutoffs(theta_e, cutoff = seq(0.05, 0.95, 0.3))

## ---- dpi = 66-----------------------------------------------------------
data(pd.d, package = "propr") # top 1000 disjointed pairs
data(pd.e, package = "propr") # top 1000 emergent pairs

## ---- dpi = 66, message = FALSE, fig.keep = "last"-----------------------
tab <- getResults(pd.d)
plot(pd.d@counts[, 39], pd.d@counts[, 37], col = ifelse(pd.d@group == "WA", "red", "blue"))
grp1 <- pd.d@group == "WA"
grp2 <- pd.d@group != "WA"
abline(a = 0, b = pd.d@counts[grp1, 37] / pd.d@counts[grp1, 39], col = "red")
abline(a = 0, b = pd.d@counts[grp2, 37] / pd.d@counts[grp2, 39], col = "blue")

## ---- dpi = 66, fig.keep = "last"----------------------------------------
plot(pd.d@counts[, 37] / pd.d@counts[, 39],
     col = ifelse(pd.d@group == "WA", "red", "blue"))

## ---- dpi = 66, fig.keep = "last"----------------------------------------
tab <- getResults(pd.e)
plot(pd.e@counts[, 106], pd.e@counts[, 2], col = ifelse(pd.d@group == "WA", "red", "blue"))
grp1 <- pd.e@group == "WA"
grp2 <- pd.e@group != "WA"
abline(a = 0, b = pd.e@counts[grp1, 2] / pd.e@counts[grp1, 106], col = "red")
abline(a = 0, b = pd.e@counts[grp2, 2] / pd.e@counts[grp2, 106], col = "blue")

## ---- dpi = 66, fig.keep = "last"----------------------------------------
plot(pd.e@counts[, 2] / pd.e@counts[, 106],
     col = ifelse(pd.d@group == "WA", "red", "blue"))

## ------------------------------------------------------------------------
pd.f <- setActive(pd, what = "theta_f")

## ---- dpi = 66-----------------------------------------------------------
g <- plot(pd.d, cutoff = 1000)

## ---- dpi = 66-----------------------------------------------------------
g <- plot(pd.e, cutoff = 1000)

## ---- dpi = 66, fig.keep = "first"---------------------------------------
parallel(pd.d, cutoff = .15, include = "c19327_g2_i3")

## ---- dpi = 66, fig.keep = "first"---------------------------------------
parallel(pd.e, include = "c27054_g5_i1")

## ---- dpi = 66, eval = FALSE---------------------------------------------
#  data(caneToad.counts)
#  keep <- apply(caneToad.counts, 2, function(x) sum(x >= 40) >= 20 & all(x != 0))
#  caneToad.sub <- caneToad.counts[, keep]
#  rho <- perb(caneToad.sub)[">", .95, tiny = TRUE]
#  plot(pd.d, propr = rho, d3 = TRUE)
#  plot(pd.e, propr = rho, d3 = TRUE)

