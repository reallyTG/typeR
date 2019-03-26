## ----message = FALSE-----------------------------------------------------
library(tracerer)

## ------------------------------------------------------------------------
trees_file <- get_tracerer_path("beast2_example_output.trees")
testit::assert(file.exists(trees_file))

## ------------------------------------------------------------------------
posterior_trees <- parse_beast_trees(trees_file)

## ------------------------------------------------------------------------
names(posterior_trees)
testit::assert(length(posterior_trees) == 11)

## ------------------------------------------------------------------------
testit::assert(class(posterior_trees[[1]]) == "phylo")

## ------------------------------------------------------------------------
for (p in posterior_trees) {
  graphics::plot(p)
}

## ----fig.width = 7, fig.height = 7---------------------------------------
phangorn::densiTree(
  posterior_trees, 
  type = "cladogram", 
  alpha = 1
)

