## ---- message = FALSE, warning = FALSE-----------------------------------
library(ape)
library(adephylo)
library(phylobase)
library(phylosignal)
data(carni19)

## ------------------------------------------------------------------------
tre <- read.tree(text = carni19$tre)

## ------------------------------------------------------------------------
dat <- data.frame(carni19$bm)
dat$random <- rnorm(dim(dat)[1], sd = 10)
dat$bm <- rTraitCont(tre)

## ------------------------------------------------------------------------
p4d <- phylo4d(tre, dat)

## ----fig.width=8, fig.height=5-------------------------------------------
barplot(p4d)
dotplot(p4d)
gridplot(p4d)

## ----fig.width=8, fig.height=5-------------------------------------------
dotplot(p4d, tree.type = "cladogram")

## ----fig.width=6, fig.height=6-------------------------------------------
gridplot(p4d, tree.type = "fan", tip.cex = 0.6, show.trait = FALSE)

## ----fig.width=8, fig.height=5-------------------------------------------
barplot(p4d, tree.ratio = 0.5)

## ----fig.width=8, fig.height=5-------------------------------------------
barplot(p4d, trait = c("bm", "carni19.bm"))

## ----fig.width=8, fig.height=5-------------------------------------------
mat.e <- matrix(abs(rnorm(19 * 3, 0, 0.5)), ncol = 3,
                dimnames = list(tipLabels(p4d), names(tdata(p4d))))
barplot(p4d, error.bar.sup = mat.e, error.bar.inf = mat.e)

## ----fig.width=8, fig.height=6-------------------------------------------
barplot(p4d, tree.type = "fan", tip.cex = 0.6, tree.open.angle = 160, trait.cex = 0.6)

## ----fig.width=8, fig.height=5-------------------------------------------
barplot(p4d, bar.col = rainbow(19))

## ----fig.width=8, fig.height=5-------------------------------------------
mat.col <- ifelse(tdata(p4d, "tip") < 0, "red", "grey35")
barplot(p4d, center = FALSE, bar.col = mat.col)

## ----fig.width=8, fig.height=5-------------------------------------------
barplot(p4d, trait.bg.col = c("#F6CED8", "#CED8F6", "#CEF6CE"), bar.col = "grey35")

## ----fig.width=5, fig.height=6-------------------------------------------
gridplot(p4d, tree.type = "fan", tree.ratio = 0.5,
         show.trait = FALSE, show.tip = FALSE,
         cell.col = terrain.colors(100))

## ----fig.width=8, fig.height=5-------------------------------------------
tip.col <- rep(1, nTips(p4d))
tip.col[(mat.col[, 2] == "red") | (mat.col[, 3] == "red")] <- 2
barplot(p4d, center = FALSE, trait.bg.col = c("#F6CED8", "#CED8F6", "#CEF6CE"),
        bar.col = mat.col, tip.col = tip.col, trait.font = c(1, 2, 2))

## ----fig.width=8, fig.height=5-------------------------------------------
barplot(p4d)
focusTree()
add.scale.bar()

## ----fig.width=8, fig.height=5-------------------------------------------
barplot(p4d)
focusTraits(2)
abline(v = 1, col = 2)

## ----fig.width=8, fig.height=5-------------------------------------------
barplot(p4d)
focusTips()
rect(xleft = 0, ybottom = 0.5,
     xright = 0.95, ytop = 3.5,
     col = "#FF000020", border = NA)

