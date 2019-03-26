## ---- message = FALSE, warning = FALSE-----------------------------------
library(phylosignal)
library(adephylo)
library(ape)
library(phylobase)
data(carni19)

## ------------------------------------------------------------------------
tre <- read.tree(text=carni19$tre)

## ------------------------------------------------------------------------
dat <- list()
dat$mass <- carni19$bm
dat$random <- rnorm(19, sd = 10)
dat$bm <- rTraitCont(tre)
dat <- as.data.frame(dat)

## ------------------------------------------------------------------------
p4d <- phylo4d(tre, dat)

## ----fig.width=8, fig.height=5-------------------------------------------
barplot.phylo4d(p4d, tree.type = "phylo", tree.ladderize = TRUE)

## ------------------------------------------------------------------------
phyloSignal(p4d = p4d, method = "all")

## ----message=FALSE, warning=FALSE, results='hide'------------------------
phylosim <- phyloSim(tree = tre, method = "all", nsim = 100, reps = 99)

## ----fig.width=12, fig.height=5------------------------------------------
plot(phylosim, stacked.methods = FALSE, quantiles = c(0.05, 0.95))

## ----fig.width=5, fig.height=4-------------------------------------------
plot.phylosim(phylosim, what = "pval", stacked.methods = TRUE)

## ----fig.width=5, fig.height=4-------------------------------------------
mass.crlg <- phyloCorrelogram(p4d, trait = "mass")
random.crlg <- phyloCorrelogram(p4d, trait = "random")
bm.crlg <- phyloCorrelogram(p4d, trait = "bm")

plot(mass.crlg)
plot(random.crlg)
plot(bm.crlg)

## ----fig.width=6, fig.height=5-------------------------------------------
carni.lipa <- lipaMoran(p4d)
carni.lipa.p4d <- lipaMoran(p4d, as.p4d = TRUE)

barplot.phylo4d(p4d, bar.col=(carni.lipa$p.value < 0.05) + 1, center = FALSE , scale = FALSE)
barplot.phylo4d(carni.lipa.p4d, bar.col = (carni.lipa$p.value < 0.05) + 1, center = FALSE, scale = FALSE)

