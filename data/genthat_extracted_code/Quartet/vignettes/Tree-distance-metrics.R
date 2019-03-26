## ----initialize, echo=FALSE----------------------------------------------
library('Quartet')
cbPalette8 <- Ternary::cbPalette8

ColPlot <- function (tr, title=NULL, bold=NULL, ...) {
  tr$edge.length <- rep(1, dim(tr$edge)[1])
  font <- rep(1, length(tr$tip.label))
  if (!is.null(bold)) font[tr$tip.label %in% bold] <- 4
  plot(tr, tip.col=Ternary::cbPalette15[-c(4, 7)][as.integer(tr$tip.label)], 
       main=title, cex.main=0.8, font=font, y.lim=c(-3.5, 11), ...)
}

RFPlot <- function (tr, title=NULL, highlight=NULL, ref=sq_trees[[1]], ...) {
  tree_dist <- phangorn::treedist(tr, ref)
  tree_pair <- lapply(list(tr, ref), ape::root, outgroup='1', resolve.root=FALSE)
  class(tree_pair) <- 'multiPhylo'
  topo_dist <- as.matrix(ape::dist.topo(tree_pair, method='PH85'))[2]
  
  ColPlot(tr, title, highlight, cex=0.8, ...)
  text_x <- par('usr')[2] * 0.5
  
  text(text_x, -0.5, 'Quartet:', cex=0.8, pos=2)
  text(text_x, -1.5, "RF:", cex=0.8, pos=2)
  text(text_x, -2.5, "Path:", cex=0.8, pos=2)
  text(text_x, -3.5, "SPR:", cex=0.8, pos=2)
  text(text_x, -0.5, paste0(QuartetStatus(list(tr, ref))[2, 'd'],
                            '/', choose(11,4)), cex=0.8, pos=4)
  text(text_x, -1.5, paste0(topo_dist, '/', (11L - 3L) * 2L), cex=0.8, pos=4)
  text(text_x, -2.5, paste0(signif(tree_dist[2], 3)), cex=0.8, pos=4)
  text(text_x, -3.5, paste0(phangorn::sprdist(tr, ref)[1]), cex=0.8, pos=4)
}

Phangorn <- function (linkText) {
  paste0('[`', linkText, '`](https://www.rdocumentation.org/packages/phangorn/topics/treedist])')
}

## ----Three-four-taxon-trees, echo=FALSE, cache=TRUE, fig.width=6, fig.asp=1/3, out.width='66%', fig.align='center'----
par(mfrow=c(1, 3), mar=c(0.5, 1, 0.5, 1), cex=1)
plot(ape::read.tree(text='((A, B), (C, D));'), tip.color=cbPalette8[c(1, 4, 7, 5)], font=2)
plot(ape::read.tree(text='((A, C), (B, D));'), tip.color=cbPalette8[c(1, 7, 4, 5)], font=2)
plot(ape::read.tree(text='((A, D), (C, B));'), tip.color=cbPalette8[c(1, 5, 7, 4)], font=2)

## ----Plot-a-quartet, echo=FALSE, cache=TRUE, fig.asp=1.3/3, fig.width=6, out.width='80%', fig.align='center'----
par(mfrow=c(1, 3))
set.seed(7)
trees7 <- lapply(logical(3), function (X) {
    tr <- ape::rtree(7, br=NULL)
    tr$edge.length <- rep(1, 12)
    tr$tip.label <- LETTERS[1:7]
    tr
  })
PlotQuartet(trees7, LETTERS[1:4], cex=1.4, font=2)

## ----Moving-a-single-taxon, fig.asp=1.8/5, out.width='100%', fig.width=6, echo=FALSE, message=FALSE, cache=TRUE----
par(mfrow=c(1, 4), mar=rep(0.4, 4))
ColPlot(sq_trees[[1]],     'Reference tree', 1)
RFPlot(sq_trees$move_one_near, 'Short move', 1)
RFPlot(sq_trees$move_one_mid, 'Medium move', 1)
RFPlot(sq_trees$move_one_far,   'Long move', 1)

## ----Moving-a-cherry, echo=FALSE, message=FALSE, cache=TRUE, fig.asp=1.6*3/3, fig.width=6, out.width='66%', fig.align='center'----
par(mfrow=c(3, 3), mar=c(2.4, 0.4, 0.4, 0.4), cex=1)

ColPlot(sq_trees[[1]], 'Reference tree')
RFPlot(sq_trees$move_one_near, 'Short move 1', 1)
RFPlot(sq_trees$move_two_near, 'Short move 2', 10:11)

ColPlot(sq_trees[[1]], 'Reference tree')
RFPlot(sq_trees$move_one_mid, 'Medium move 1', 1)
RFPlot(sq_trees$move_two_mid, 'Medium move 2', 10:11)

ColPlot(sq_trees[[1]], 'Reference tree')
RFPlot(sq_trees$move_one_far,   'Long move 1', 1)
RFPlot(sq_trees$move_two_far,   'Long move 2', 10:11)


## ----Pectinate-to-break-RF, echo=FALSE, message=FALSE, cache=TRUE, fig.asp=1.5/3, fig.width=6, fig.align='center'----
par(mfrow=c(1, 3), mar=rep(0.4, 4))

pectinate_tree  <- ape::read.tree(text='(1, (2, (3, (4, (5, (6, (7, (8, (9, (10, 11))))))))));')
pectinate_unrooted <- ape::unroot(pectinate_tree)
pectinate_move1 <- ape::read.tree(text='(2, (3, (4, (5, (6, (7, (8, (9, (10, (11, 1))))))))));')
ColPlot(pectinate_tree, 'Pectinate tree')
RFPlot(pectinate_move1, 'Move one taxon', 1, ref=pectinate_unrooted)
RFPlot(sq_trees$random_tree, 'Random tree', 1, ref=pectinate_unrooted)

## ----Random-trees, echo=FALSE, cache=TRUE, warn=FALSE, message=FALSE, fig.height=4.6, fig.width=5.6, out.width='80%', fig.align='center'----
pectinate_tree  <- ape::read.tree(text='(1, (2, (3, (4, (5, (6, (7, (8, (9, (10, 11))))))))));')
pectinate_unrooted <- ape::unroot(pectinate_tree)
pectinate_move1 <- ape::read.tree(text='(2, (3, (4, (5, (6, (7, (8, (9, (10, (11, 1))))))))));')

n_random <- if (Sys.getenv('TRAVIS') == "") 10000 else 10
random_trees <- lapply(seq_len(n_random), function (x) ape::rtree(11, br=NULL, tip.label=1:11))
random_quartets <- QuartetStatus(random_trees, cf=pectinate_tree)[, 'd'] / choose(11, 4)
random_distances <- vapply(random_trees, phangorn::treedist,
                           tree2=pectinate_tree, double(2))
random_spr <- vapply(random_trees, phangorn::sprdist, tree2=pectinate_tree, double(4))

par(mfrow=c(2, 2), mar=rep(1.9, 4), cex=0.8, oma=c(0, 0, 2, 0))
manyBreaks <- seq(0, 1, length.out=40)

PlotHist <- function (distances, breaks, pectDist, title) {
  hist(distances, xlab=NULL, main=NULL, breaks=breaks, cex=0.8)
  legend('topleft', bty='n', c('', '', title), cex=0.8)
  abline(v=pectDist, col=cbPalette8[3], lwd=2)
}

PlotHist(random_distances[1, ] / 16, manyBreaks, 1, 'Robinson-Foulds distance')
mtext('Distance between pectinate tree (above) and random trees', outer=TRUE, cex=0.8)
legend('topleft', bty='n', col=cbPalette8[3], lwd=2, '"Move one taxon" tree', cex=0.8)

PlotHist(random_distances[2, ], breaks=manyBreaks*max(random_distances[2, ]),
         17.7, "Path distance")

PlotHist(random_quartets, manyBreaks, 120 / 330, 'Quartet dissimilarity')

PlotHist(random_spr[1, ], max(random_spr[1, ]) * manyBreaks, 1, 'SPR distance')

## ----Increasing-distances, echo=FALSE, message=FALSE, cache=TRUE, fig.asp=1.4/3, fig.width=6, out.width='90%', fig.align='center'----
par(mfrow=c(1, 3), mar=rep(0.4, 4))
ColPlot(sq_trees[[1]], 'Reference tree')
RFPlot(sq_trees$random_tree,   'Random tree'     )
RFPlot(sq_trees$opposite_tree, 'Maximum distance')

## ----two-trees, echo=FALSE, fig.height = 3, fig.width=6------------------
par(mfrow=c(1, 2), mar=rep(0.8, 4), cex=0.9)
plot(balancedTree <- ape::read.tree(text="(((a, b), (c, d)), ((e, f), (g, h)));"),
     edge.color = cbPalette8[3])
ape::edgelabels(1:5, c(1, 2, 5, 9, 12))
legend('topleft', 'Balanced tree', bty='n')

plot(caterpillarTree <- ape::read.tree(text="(a, (b, (c, (d, (e, (f, (g, h)))))));"),
     edge.color = cbPalette8[2])
ape::edgelabels(1:5, c(4, 6, 8, 10, 12))
legend('topleft', 'Asymmetric tree', bty='n')

## ----ic-of-splits, display='asis', echo=FALSE----------------------------
splitSmall <- 2:4
splitLarge <- 8L - splitSmall

rootedTrees <- c(
  '1' = 1,
  '2' = 1 * 1,
  '3' = 3 * 1,
  '4' = 5 * 3 * 1,
  '5' = 7 * 5 * 3 * 1,
  '6' = 9 * 7 * 5 * 3 * 1
)

matchingTrees <- rootedTrees[splitSmall] * rootedTrees[splitLarge]
names(matchingTrees) <- paste0("Partition size: ", splitSmall, ':', splitLarge)

matchingP <- matchingTrees / (11 * 9 * 7 * 5 * 3 * 1 * 1)

ic <- -log(matchingP) / log(2)

knitr::kable(cbind(
      'Matching trees' = matchingTrees,
      'p(Match in random tree)' = signif(matchingP, 3),
      'Information content / bits' = ic))

## ----all-8-tip-trees, echo=FALSE, cache=TRUE-----------------------------
#calculate <- FALSE
#if (calculate) {
#  all8 <- phytools::allFurcTrees(8, letters[1:8], FALSE)
#  allBif8 <- all8[vapply(all8, function(x) x$Nnode, 1L) == 6]
#  inBalanced <- SplitStatus(allBif8, balancedTree)[, 's']
#  inCaterpillar <- SplitStatus(allBif8, caterpillarTree)[, 's']
#  qInBalanced <- QuartetStatus(allBif8, balancedTree)[, 's']
#  qInCaterpillar <- QuartetStatus(allBif8, balancedTree)[, 's']
#} else {
  inBalanced <- rep(0:5, c(7088, 2708, 512, 76, 10, 1))
  inCaterpillar <- rep(0:5, c(8162, 1808, 350, 64, 10, 1))
  qInBalanced <- qInCaterpillar <- rep(c(10:42, 44:46, 49, 50, 53, 54, 57, 62, 70),
    c(32, 256, 512, 384, 512, 320, 512, 448, 512, 512, 688, 160, 512, 448, 256, 464, 416, 448, 576, 256, 192, 320, 160, 288, 128, 192, 132, 80, 32, 32, 224, 64, 8, 64, 112, 16, 64, 16, 4, 18, 16, 8, 1))
#}

par(mfrow=c(1, 2))
plot.new()
plot.window(main='8-tip trees with N common splits', cex.main=1,
            xlim=c(0, 6), ylim=c(0, 2708),
            xlab='Splits in common', ylab='Number of trees')
sch <- hist(inCaterpillar + 0.5, breaks = 0:12 / 2 - 0.0001, plot=FALSE)
sbh <- hist(inBalanced, breaks = 0:12 / 2 - 0.0001, plot=FALSE)
plot(sch, col=paste0(cbPalette8[2], '44'), add=TRUE)
plot(sbh, col=paste0(cbPalette8[3], '44'), add=TRUE)
text(0.0, 100, paste0('Balanced: ', sum(inBalanced == 0)), pos=4, srt=90, cex=0.7)
text(0.5, 100, paste0('Asymmetric: ', sum(inCaterpillar == 0)), pos=4, srt=90, cex=0.7)

legend('topright', pch=22,
       pt.cex = 2, col='black',
       pt.bg = paste0(cbPalette8[2:3], '44'), bty='n',
       c('Asymmetric', 'Balanced'))
axis(1, at=0:5 + 0.5, labels=0:5)
axis(2)

qch <- hist(qInCaterpillar, breaks = 0:36 * 2 - 0.0001, plot=FALSE)
qbh <- hist(qInBalanced,    breaks = 0:36 * 2 - 0.0001, plot=FALSE)

plot(qch, col=paste0(cbPalette8[2], '44'), main='8-tip trees with N common quartets',
     xlab='Quartets in common', ylab='Number of trees', axes=FALSE, cex.main=1)
plot(qbh, col=paste0(cbPalette8[3], '44'), add=TRUE)
axis(1, at=0:36 * 2, labels=(0:36) * 2)
axis(2)


