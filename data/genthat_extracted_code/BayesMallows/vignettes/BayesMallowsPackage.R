## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
set.seed(232312)

## ---- message=FALSE------------------------------------------------------
library(BayesMallows)

## ---- message=FALSE------------------------------------------------------
library(dplyr)
library(ggplot2)
library(tidyr)

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(potato_visual, caption = "Example dataset `potato_visual`.")

## ------------------------------------------------------------------------
model_fit <- compute_mallows(potato_visual)

## ---- eval=FALSE---------------------------------------------------------
#  class(model_fit)
#  names(model_fit)

## ---- fig.width=6--------------------------------------------------------
assess_convergence(model_fit)

## ---- fig.width=6--------------------------------------------------------
assess_convergence(model_fit, parameter = "rho", items = 1:5)

## ------------------------------------------------------------------------
model_fit$burnin <- 1000

## ------------------------------------------------------------------------
plot(model_fit)

## ------------------------------------------------------------------------
intervals <- compute_posterior_intervals(model_fit, parameter = "alpha")

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(intervals)

## ---- fig.width=6, fig.height=6------------------------------------------
plot(model_fit, parameter = "rho", items = 1:20)

## ---- eval=FALSE---------------------------------------------------------
#  compute_posterior_intervals(model_fit, parameter = "rho")

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(compute_posterior_intervals(model_fit, parameter = "rho"))

## ------------------------------------------------------------------------
model_fit <- compute_mallows(potato_visual, alpha_jump = 10)

## ---- fig.width=6--------------------------------------------------------
assess_convergence(model_fit, parameter = "alpha")

## ---- eval=FALSE---------------------------------------------------------
#  model_fit <- compute_mallows(potato_visual, alpha_jump = 10, rho_thinning = 2)

## ---- eval=FALSE---------------------------------------------------------
#  model_fit <- compute_mallows(potato_visual, metric = "kendall")

## ---- error=TRUE---------------------------------------------------------
potato_modified <- potato_visual
potato_modified[1, 1:2] <- 1

model_fit <- compute_mallows(potato_modified)

## ---- message=FALSE------------------------------------------------------
potato_top <- potato_visual * if_else(potato_visual > 5, NA_integer_, 1L)

## ------------------------------------------------------------------------
item_ranked <- apply(potato_top, 2, function(x) !all(is.na(x)))
potato_top <- potato_top[, item_ranked, drop = FALSE]

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(potato_top, caption = "Example dataset `potato_top`.")

## ------------------------------------------------------------------------
model_fit <- compute_mallows(potato_top, save_aug = TRUE)

## ------------------------------------------------------------------------
model_fit$any_missing

## ---- eval=FALSE---------------------------------------------------------
#  model_fit$aug_acceptance

## ---- echo=FALSE, result='asis'------------------------------------------
knitr::kable(model_fit$aug_acceptance, digits = 2)

## ---- fig.width=6--------------------------------------------------------
assess_convergence(model_fit, parameter = "Rtilde", assessors = 1, 
                   items = "P14")

## ---- eval=FALSE---------------------------------------------------------
#  assess_convergence(model_fit, parameter = "Rtilde", assessors = 1,
#                     items = c("P7", "P9", "P10", "P12", "P13"))

## ---- eval=FALSE---------------------------------------------------------
#  model_fit <- compute_mallows(potato_top, metric = "cayley")
#  model_fit <- compute_mallows(potato_top, metric = "kendall")
#  model_fit <- compute_mallows(potato_top, metric = "spearman")

## ------------------------------------------------------------------------
missing_indicator <- if_else(
  runif(nrow(potato_visual) * ncol(potato_visual)) < 0.1,
                            NA_real_, 1)
potato_missing <- potato_visual * missing_indicator

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(potato_missing, caption = "Example dataset `potato_missing`.")

## ------------------------------------------------------------------------
model_fit <- compute_mallows(potato_missing)

## ---- eval=FALSE---------------------------------------------------------
#  assess_convergence(model_fit)

## ---- eval=FALSE---------------------------------------------------------
#  assess_convergence(model_fit, parameter = "rho", items = 1:6)

## ---- eval=FALSE---------------------------------------------------------
#  bind_cols(model_fit$aug_acceptance,
#            n_missing = apply(potato_missing, 1, function(x) sum(is.na(x))))

## ---- echo=FALSE, result='asis'------------------------------------------
knitr::kable(
  bind_cols(model_fit$aug_acceptance, 
          n_missing = apply(potato_missing, 1, function(x) sum(is.na(x)))), 
  digits = 2)

## ---- message=FALSE, results='asis'--------------------------------------
pair_comp <- tribble(
  ~assessor, ~bottom_item, ~top_item,
  1, 1, 2,
  1, 2, 5,
  1, 4, 5,
  2, 1, 2,
  2, 2, 3,
  2, 3, 4
)

## ------------------------------------------------------------------------
knitr::kable(pair_comp, caption = "Dataset `pair_comp`.")

## ------------------------------------------------------------------------
pair_comp_tc <- generate_transitive_closure(pair_comp)

## ---- results='asis', echo=FALSE-----------------------------------------
knitr::kable(pair_comp_tc, caption = "Dataframe `pair_comp_tc`.")

## ------------------------------------------------------------------------
initial_ranking <- generate_initial_ranking(pair_comp_tc)

## ---- eval=FALSE---------------------------------------------------------
#  beach_preferences

## ---- results='asis', echo=FALSE-----------------------------------------
knitr::kable(head(beach_preferences, 6), caption = "Example dataset `beach_preferences`")

## ------------------------------------------------------------------------
beach_tc <- generate_transitive_closure(beach_preferences)

## ------------------------------------------------------------------------
str(beach_preferences)
str(beach_tc)

## ------------------------------------------------------------------------
beach_init_rank <- generate_initial_ranking(beach_tc)

## ---- results='asis', echo=FALSE-----------------------------------------
knitr::kable(head(beach_init_rank, 6), caption="First 6 rows in `beach_init_rank`.")

## ------------------------------------------------------------------------
colnames(beach_init_rank) <- paste0("B", seq(from = 1, to = ncol(beach_init_rank), by = 1))

## ---- error=TRUE---------------------------------------------------------
test_run <- compute_mallows(
  rankings = beach_init_rank, 
  preferences = beach_tc,
  save_aug = TRUE
  )

## ---- eval=FALSE---------------------------------------------------------
#  beach_tc %>%
#    filter(assessor == 1, bottom_item == 2 | top_item == 2)

## ---- results='asis', echo=FALSE-----------------------------------------
beach_tc %>% 
  filter(assessor == 1, bottom_item == 2 | top_item == 2) %>% 
  knitr::kable()

## ---- fig.width=6--------------------------------------------------------
assess_convergence(test_run, parameter = "Rtilde", 
                   assessors = 1, items = c(2, 6, 15))

## ------------------------------------------------------------------------
beach_tc %>% 
  filter(assessor == 1, bottom_item %in% c(2, 4), top_item %in% c(2, 4)) %>% 
  nrow()

## ---- fig.width=6--------------------------------------------------------
assess_convergence(test_run, parameter = "Rtilde", 
                   assessors = 1, items = c(2, 4))

## ------------------------------------------------------------------------
beach_tc %>% 
  filter(assessor == 1, bottom_item %in% c(5, 8), top_item %in% c(5, 8)) %>% 
  nrow()

## ---- fig.width=6--------------------------------------------------------
assess_convergence(test_run, parameter = "Rtilde", 
                   assessors = 1, items = c(5, 8))

## ---- eval=FALSE---------------------------------------------------------
#  beach_tc %>%
#    filter(assessor == 2, bottom_item == 10 | top_item == 10)

## ---- results='asis', echo=FALSE-----------------------------------------
beach_tc %>% 
  filter(assessor == 2, bottom_item == 10 | top_item == 10) %>% 
  knitr::kable()

## ---- fig.width=6--------------------------------------------------------
assess_convergence(test_run, parameter = "Rtilde", 
                   assessors = 2, items = c(5, 7, 10))

## ------------------------------------------------------------------------
beach_tc %>% 
  filter(assessor == 1, bottom_item %in% c(1, 15), top_item %in% c(1, 15)) %>% 
  nrow()

## ---- fig.width=6--------------------------------------------------------
assess_convergence(test_run, parameter = "Rtilde", 
                   assessors = 2, items = c(1, 15))

## ------------------------------------------------------------------------
rm(test_run)

## ------------------------------------------------------------------------
model_fit <- compute_mallows(
  rankings = beach_init_rank, 
  preferences = beach_tc,
  nmc = 6000,
  save_aug = TRUE
  )

model_fit$burnin <- 1000

## ---- eval=FALSE---------------------------------------------------------
#  compute_consensus(model_fit, type = "CP")

## ---- results='asis', echo=FALSE-----------------------------------------
knitr::kable(compute_consensus(model_fit, type = "CP"), digits = 2)

## ---- eval=FALSE---------------------------------------------------------
#  compute_consensus(model_fit, type = "MAP")

## ---- results='asis', echo=FALSE-----------------------------------------
knitr::kable(compute_consensus(model_fit, type = "MAP"), digits = 2)

## ---- eval=FALSE---------------------------------------------------------
#  compute_posterior_intervals(model_fit, parameter = "rho")

## ---- results='asis', echo=FALSE-----------------------------------------
knitr::kable(compute_posterior_intervals(model_fit, parameter = "rho"))

## ---- fig.width=6--------------------------------------------------------
plot_top_k(model_fit, rel_widths = c(1, 8))

## ------------------------------------------------------------------------
potato_manipulated <- potato_visual
potato_manipulated[7:12, ] <- 21 - potato_manipulated[7:12, ]

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(potato_manipulated, caption = "Dataset `potato_manipulated`.")

## ------------------------------------------------------------------------
model_fit <- compute_mallows(rankings = potato_manipulated)

## ---- fig.width=6--------------------------------------------------------
assess_convergence(model_fit)

## ------------------------------------------------------------------------
model_fit <- compute_mallows(
  rankings = potato_manipulated, 
  n_clusters = 2
  )

## ---- fig.width=6--------------------------------------------------------
assess_convergence(model_fit)

## ---- fig.width=6--------------------------------------------------------
assess_convergence(model_fit, parameter = "rho", items = c(8, 12))

## ---- fig.width=6--------------------------------------------------------
assess_convergence(model_fit, parameter = "cluster_probs")

## ---- eval=FALSE---------------------------------------------------------
#  sushi_rankings

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(head(sushi_rankings), caption = "First 6 rows of example dataset `sushi_rankings`.")

## ------------------------------------------------------------------------
model_fit1 <- compute_mallows(sushi_rankings, nmc = 1000, include_wcd = TRUE, save_clus = TRUE)
model_fit2 <- compute_mallows(sushi_rankings, n_clusters = 2, nmc = 1000, save_clus = TRUE)

## ---- fig.width=6--------------------------------------------------------
assess_convergence(model_fit2)

## ---- fig.width=6--------------------------------------------------------
assess_convergence(model_fit2, parameter = "cluster_probs")

## ------------------------------------------------------------------------
model_fit1$burnin <- 400
model_fit2$burnin <- 400

## ------------------------------------------------------------------------
cp_consensus_sushi <- compute_consensus(model_fit2, type = "CP")

## ---- eval=FALSE---------------------------------------------------------
#  filter(cp_consensus_sushi, cluster == "Cluster 1")

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(filter(cp_consensus_sushi, cluster == "Cluster 1"), digits = 2)

## ---- eval=FALSE---------------------------------------------------------
#  filter(cp_consensus_sushi, cluster == "Cluster 2")

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(filter(cp_consensus_sushi, cluster == "Cluster 2"), digits = 2)

## ------------------------------------------------------------------------
args(plot_elbow)

## ---- message=FALSE------------------------------------------------------
n_clusters <- seq(from = 1, to = 10)
nmc <- 2000
models <- compute_mallows_mixtures(n_clusters = n_clusters, 
                                   rankings = sushi_rankings,
                                   nmc = nmc, 
                                   rho_thinning = nmc - 1,
                                   aug_thinning = nmc - 1,
                                   include_wcd = TRUE
                                   )

## ---- fig.width=6--------------------------------------------------------
plot_elbow(models, burnin = 1000)

## ---- fig.width=6--------------------------------------------------------
model <- compute_mallows(rankings = sushi_rankings, nmc = nmc, n_clusters = 5, save_clus = TRUE)

## ---- fig.width=6--------------------------------------------------------
plot(model, burnin = 1000, parameter = "cluster_assignment")

## ------------------------------------------------------------------------
cluster_assignment <- assign_cluster(model, burnin = 1000, soft = FALSE)

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(head(cluster_assignment), caption = "The first few rows of `cluster_assignment`.")

