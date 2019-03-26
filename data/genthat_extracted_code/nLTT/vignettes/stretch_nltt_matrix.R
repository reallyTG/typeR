## ------------------------------------------------------------------------
library(ape)
library(nLTT) # nolint
library(testit)

## ------------------------------------------------------------------------
newick <- "((A:1,B:1):1,C:2);"
phylogeny <- ape::read.tree(text = newick)
plot(phylogeny)
add.scale.bar() #nolint

## ------------------------------------------------------------------------
nltt_plot(phylogeny)

## ------------------------------------------------------------------------
nltt <- nLTT::get_phylogeny_nltt_matrix(phylogeny)
print(nltt)

## ------------------------------------------------------------------------
nltt_plot(phylogeny)
points(nltt, pch = 19, col = "red")

## ------------------------------------------------------------------------
nltt <- nLTT::get_phylogeny_nltt_matrix(phylogeny)
stretch_matrix <- nLTT::stretch_nltt_matrix(
  nltt, dt = 0.25, step_type = "upper"
)
print(stretch_matrix)

## ------------------------------------------------------------------------
nltt_plot(phylogeny)
points(nltt, pch = 19, col = "red")
points(stretch_matrix, pch = 19, col = "blue")

## ------------------------------------------------------------------------
newick <- "((A:1,B:1):1,(C:1,D:1):1);"
phylogeny <- ape::read.tree(text = newick)
plot(phylogeny)
add.scale.bar() #nolint

## ------------------------------------------------------------------------
nltt_plot(phylogeny)

## ------------------------------------------------------------------------
nltt <- nLTT::get_phylogeny_nltt_matrix(phylogeny)
print(nltt)

## ------------------------------------------------------------------------
nltt_plot(phylogeny)
points(nltt, pch = 19, col = "red")

## ------------------------------------------------------------------------
nltt <- nLTT::get_phylogeny_nltt_matrix(phylogeny)
stretch_matrix <- nLTT::stretch_nltt_matrix(
  nltt, dt = 0.25, step_type = "upper"
)
print(stretch_matrix)

## ------------------------------------------------------------------------
nltt_plot(phylogeny)
points(nltt, pch = 19, col = "red")
points(stretch_matrix, pch = 19, col = "blue")

## ------------------------------------------------------------------------
newick <- paste0("((((XD:1,ZD:1):1,CE:2):1,(FE:2,EE:2):1):4,((AE:1,BE:1):1,",
  "(WD:1,YD:1):1):5);"
)
phylogeny <- ape::read.tree(text = newick)
plot(phylogeny)
add.scale.bar() #nolint

## ------------------------------------------------------------------------
nltt_plot(phylogeny)

## ------------------------------------------------------------------------
nltt <- nLTT::get_phylogeny_nltt_matrix(phylogeny)
print(nltt)

## ------------------------------------------------------------------------
nltt_plot(phylogeny)
points(nltt, pch = 19, col = "red")

## ------------------------------------------------------------------------
nltt <- nLTT::get_phylogeny_nltt_matrix(phylogeny)
nltt_plot(phylogeny)
stretch_matrix <- nLTT::stretch_nltt_matrix(
  nltt, dt = 0.05, step_type = "upper"
)
points(nltt, pch = 19, col = "red")
points(stretch_matrix, pch = 19, col = "blue")

