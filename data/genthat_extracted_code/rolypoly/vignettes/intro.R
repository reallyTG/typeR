## ---- message = FALSE, results='hide', warning=FALSE---------------------
# load up libraries for vignette
require(rolypoly); require(dplyr); require(ggplot2)

## ------------------------------------------------------------------------
sim_gwas_data %>% head

## ------------------------------------------------------------------------
sim_expression_data_normalized %>% head

## ------------------------------------------------------------------------
sim_block_annotation %>% head

## ------------------------------------------------------------------------
ld_path <- system.file("extdata", "example_ld", package = "rolypoly")
ld_data <- readRDS(paste(ld_path, '/1.Rds', sep = ''))
ld_data %>% head

## ---- results='hide', message = FALSE------------------------------------
rp <- rolypoly_roll(
  gwas_data = sim_gwas_data,
  block_annotation = sim_block_annotation,
  block_data = sim_expression_data_normalized,
  ld_folder = ld_path
)

## ------------------------------------------------------------------------
rp$full_results$parameters %>% sort

## ------------------------------------------------------------------------
rp$bootstrap_results %>% arrange(-bt_value) %>% head

## ---- fig.show='asis', fig.width=6, fig.height=3.5-----------------------
plot_rolypoly_annotation_estimates(rp)

## ---- fig.show='asis', fig.width=6, fig.height=3.5-----------------------
plot_rolypoly_annotation_ranking(rp)

## ---- eval = FALSE-------------------------------------------------------
#  rp <- rolypoly_roll(
#    # some new set of expression data
#    block_data = new_sim_expression_data_normalized,
#  )

