## ---- eval=FALSE---------------------------------------------------------
#  library(ape)
#  my_tree <- read.tree('my_tree.tre') # For Newick format trees
#  my_tree <- read.nexus('my_tree.nex') # For NEXUS format trees

## ---- eval=FALSE---------------------------------------------------------
#  rownames(my_data) <- my_data$species_name

## ---- eval=FALSE---------------------------------------------------------
#  my_tree$tip.label # Check the tip labels of your tree
#  rownames(my_data) <- gsub(' ', '_', my_data$species_name_with_spaces)

## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(dev = "png", fig.height = 5, fig.width = 5, dpi = 300, out.width = "450px")

## ------------------------------------------------------------------------
library(phylopath)

models <- define_model_set(
  one   = c(RS ~ DD),
  two   = c(DD ~ NL, RS ~ LS + DD),
  three = c(RS ~ NL),
  four  = c(RS ~ BM + NL),
  five  = c(RS ~ BM + NL + DD),
  six   = c(NL ~ RS, RS ~ BM),
  seven = c(NL ~ RS, RS ~ LS + BM),
  eight = c(NL ~ RS),
  nine  = c(NL ~ RS, RS ~ LS),
  .common = c(LS ~ BM, NL ~ BM, DD ~ NL)
)

## ------------------------------------------------------------------------
models$one

## ---- fig.height = 5, fig.width = 5, dpi = 300---------------------------
plot(models$one)

## ---- fig.height=8, fig.width=8, out.width = "600px"---------------------
plot_model_set(models)

## ------------------------------------------------------------------------
result <- phylo_path(models, data = rhino, tree = rhino_tree, model = 'lambda')

## ------------------------------------------------------------------------
result

## ------------------------------------------------------------------------
(s <- summary(result))

## ------------------------------------------------------------------------
plot(s)

## ------------------------------------------------------------------------
(best_model <- best(result))

## ---- warning = FALSE, fig.width = 6-------------------------------------
plot(best_model)

## ---- fig.width = 7------------------------------------------------------
average_model <- average(result)
plot(average_model, algorithm = 'mds', curvature = 0.1) # increase the curvature to avoid overlapping edges

## ---- fig.width = 7------------------------------------------------------
average_model_full <- average(result, avg_method = "full")
plot(average_model_full, algorithm = 'mds', curvature = 0.1)

## ------------------------------------------------------------------------
#coef_plot(average_model)

## ---- fig.height=3.5-----------------------------------------------------
# coef_plot(average_model_full, reverse_order = TRUE) + 
#   ggplot2::coord_flip() + 
#   ggplot2::theme_bw()

## ------------------------------------------------------------------------
result$d_sep$one

