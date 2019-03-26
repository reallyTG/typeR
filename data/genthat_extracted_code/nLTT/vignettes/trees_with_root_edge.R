## ---- include = FALSE----------------------------------------------------
# Set high warning levels
options(warn = 2)

## ------------------------------------------------------------------------
set.seed(42)
tree1 <- ape::rcoal(2)
tree1$edge.length <- tree1$edge.length / tree1$edge.length[1] # nolint ape variable name

## ------------------------------------------------------------------------
tree2 <- tree1
tree2$root.edge <- 1 # nolint ape variable name

## ----fig.width = 3, fig.height = 3---------------------------------------
ape::plot.phylo(tree1, root.edge = TRUE)
ape::add.scale.bar() #nolint

## ----fig.width = 3, fig.height = 3---------------------------------------
ape::plot.phylo(tree2, root.edge = TRUE)
ape::add.scale.bar() #nolint

## ----fig.width = 7, fig.height = 7---------------------------------------
nLTT::nltt_plot(tree1, xlim = c(0, 1), ylim = c(0, 1))
nLTT::nltt_lines(tree2, col = "red")

## ------------------------------------------------------------------------
print(nLTT::nLTTstat_exact(tree1, tree2, ignore_stem = FALSE))

## ------------------------------------------------------------------------
print(nLTT::nLTTstat_exact(tree1, tree2, ignore_stem = TRUE))

