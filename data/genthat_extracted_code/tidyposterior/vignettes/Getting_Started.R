## ----check-for-build, echo = FALSE, results='asis'-----------------------
eval_chunks <- as.logical(Sys.getenv("local_vignette_build", FALSE))
# Change this via `Sys.setenv(local_vignette_build = "TRUE")`
if(!eval_chunks) 
  cat(
    "(These documents take a long time to create, so only the code",
    "is shown here. The full version is at",
    "[https://tidymodels.github.io/tidyposterior](https://tidymodels.github.io/tidyposterior).)"
    )

## ----load, include = FALSE, message = FALSE, warning = FALSE, eval = eval_chunks----
#  library(tidyposterior)
#  library(ggplot2)
#  library(tidyverse)
#  theme_set(theme_bw())
#  options(width = 100, digits = 3)

## ----roc-data, eval = eval_chunks----------------------------------------
#  library(tidyposterior)
#  data("precise_example")
#  
#  library(tidyverse)
#  
#  rocs <- precise_example %>%
#     select(id, contains("ROC")) %>%
#     setNames(tolower(gsub("_ROC$", "", names(.))))
#  rocs
#  
#  library(ggplot2)
#  
#  rocs_stacked <- gather(rocs)
#  
#  ggplot(rocs_stacked, aes(x = model, y = statistic, group = id, col = id)) +
#    geom_line(alpha = .75) +
#    theme(legend.position = "none")

## ----linear-model, eval = eval_chunks------------------------------------
#  roc_model <- perf_mod(rocs, seed = 2824)

## ----save-mod, include = FALSE, eval = eval_chunks-----------------------
#  # Two objects are saved to be used in the man files
#  # `build_site` runs these in `tidyposterior/docs/articles`
#  try(save(roc_model, file = "../../inst/examples/roc_model.RData", compress = TRUE), silent = TRUE)

## ----linear-model-results, eval = eval_chunks----------------------------
#  roc_model$stan

## ----linear-model-post, eval = eval_chunks-------------------------------
#  roc_post <- tidy(roc_model)
#  head(roc_post)

## ----linear-model-post-plot, eval = eval_chunks--------------------------
#  ggplot(roc_post) +
#    # Add the observed data to check for consistency
#    geom_point(
#      data = rocs_stacked,
#      aes(x = model, y = statistic),
#      alpha = .5, col = "blue"
#    )

## ----glm-v-nnet, eval = eval_chunks--------------------------------------
#  glm_v_nnet <- contrast_models(roc_model, "nnet", "glm")
#  head(glm_v_nnet)

## ----save-contrast, include = FALSE, eval = eval_chunks------------------
#  try(save(glm_v_nnet, file = "../../inst/examples/glm_v_nnet.RData", compress = TRUE), silent = TRUE)

## ----glm-v-nnet-summary, eval = eval_chunks------------------------------
#  summary(glm_v_nnet, size = 0.02)

## ----glm-v-nnet-plot, eval = eval_chunks---------------------------------
#  ggplot(glm_v_nnet, size = 0.02)

