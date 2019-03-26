## ---- fig.align='center', fig.width=10, fig.height=8, out.height="600px", fig.dpi = 600----
library(phylopath)

models <- define_model_set(
  A = c(C~M+D),
  B = c(C~D),
  C = c(C~D, P~M),
  D = c(C~D, M~P, G~P),
  E = c(C~D, P~M, G~P),
  F = c(C~D, P~M+G),
  G = c(C~D, M~P, P~G),
  H = c(C~D, M~P),
  I = c(C~D, M~M, G~P),
  J = c(M~P, G~D),
  K = c(P~M, G~D),
  L = c(C~M+D, P~M+G),
  .common = c(C~P+G)
)

plot_model_set(models, algorithm = 'kk')

## ------------------------------------------------------------------------
(cichlids_results <- phylo_path(models, cichlids, cichlids_tree))

## ------------------------------------------------------------------------
(s <- summary(cichlids_results))
plot(s)

## ------------------------------------------------------------------------
best_cichlids <- best(cichlids_results)

## ------------------------------------------------------------------------
best_cichlids

## ------------------------------------------------------------------------
coef_plot(best_cichlids, error_bar = "se", reverse_order = TRUE) + ggplot2::coord_flip()

## ---- fig.align='center', fig.width=8, fig.height=4, out.width="600px", fig.dpi = 300----
plot(best_cichlids)

