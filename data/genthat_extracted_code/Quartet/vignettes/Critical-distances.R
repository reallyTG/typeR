## ----Load package, include=FALSE-----------------------------------------
require('Quartet')

## ----Example tree--------------------------------------------------------
tree_a <- ape::read.tree(text="((1, 2), (3, (4, 5)));")

## ----Plot trees, fig.height=1.6, fig.width=2, echo=FALSE-----------------
par(mar=rep(0.3, 4))
plot(tree_a)

## ----none-in-common------------------------------------------------------
tree_b <- ape::read.tree(text="((1, 5), (3, (2, 4)));")

## ----Plot next tree, fig.height=1.6, fig.width=2, echo=FALSE-------------
par(mar=rep(0.3, 4))
plot(tree_b)

## ----tree-c--------------------------------------------------------------
tree_c <- ape::read.tree(text="((1, 2), ((3, 6), (4, 5)));")

## ----Add-tip-6-to-Tree-C, fig.height=1.6, fig.width=2, echo=FALSE--------
par(mar=rep(0.3, 4))
plot(tree_c, tip.color=c(1,1,1,2,1,1))

## ----Adding tip 6 to Tree B duplicates a quartet, fig.height=5, fig.width=2.5, echo=FALSE----
PlotApeTree <- function (text, quartet) {
  orig <- TreeSearch::RenumberTips(tree_c, as.character(1:6))
  tree <- ape::read.tree(text=text)
  PlotQuartet(list(orig, TreeSearch::RenumberTips(tree, as.character(1:6))), quartet, overwritePar=FALSE, cex=0.9)
}

par(mfrow=c(7, 2), mar=rep(0.4, 4), cex=0.9)
PlotApeTree("(((1, 6), 5), (3, (2, 4)));", c(1, 6, 4, 5))
PlotApeTree("((1, 5), (3, ((2, 6), 4)));", c(2, 6, 4, 5))
PlotApeTree("((1, 5), ((3, 6), (2, 4)));", c(3, 6, 4, 5))
PlotApeTree("((1, 5), (3, (2, (4, 6))));", c(4, 6, 1, 2))
PlotApeTree("((1, (5, 6)), (3, (2, 4)));", c(5, 6, 1, 2))
PlotApeTree("(((1, 5), 6), (3, (2, 4)));", c(1, 5, 3, 6))
PlotApeTree("((1, 5), (3, ((2, 4), 6)));", c(4, 2, 3, 6))

## ----mean-proportion-----------------------------------------------------
round(vapply(4:20, function (n_tip) {
 trees <- lapply(logical(56), function (X) 
   ape::rtree(n_tip, tip.label=seq_len(n_tip), br=NULL))
 results <- QuartetStatus(trees)[1, ] / choose(n_tip, 4)
 c(mean(results[-1]), sd(results[-1]))
}, double(2)), 3)

