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

## ----rmse-results, eval = eval_chunks------------------------------------
#  library(tidyposterior)
#  data("noisy_example")
#  
#  library(tidyverse)
#  
#  rmses <- noisy_example %>%
#     select(id, id2, contains("RMSE")) %>%
#     setNames(tolower(gsub("_RMSE$", "", names(.))))
#  
#  stacked_rmse <- gather(rmses)
#  
#  mean_rmse <- stacked_rmse %>%
#    group_by(model) %>%
#    summarise(statistic = mean(statistic))
#  
#  library(ggplot2)
#  
#  ggplot(stacked_rmse,
#         aes(
#           x = model,
#           y = statistic,
#           group = paste(id, id2),
#           col = paste(id, id2))
#         ) +
#    geom_line(alpha = .75) +
#    theme(legend.position = "none")
#  
#  ggplot(stacked_rmse, aes(col = model, x = statistic)) +
#    geom_line(stat = "density", trim = FALSE) +
#    theme(legend.position = "top")

## ----gamma-stats, eval = eval_chunks-------------------------------------
#  gamma_model <- perf_mod(rmses, family = Gamma(), seed = 74)
#  
#  # Get the posterior distributions of the mean parameters:
#  gamma_post <- tidy(gamma_model, seed = 3750)
#  gamma_mean <- summary(gamma_post)
#  gamma_mean

## ----gamma, eval = eval_chunks-------------------------------------------
#  ggplot(gamma_post) +
#    geom_point(data = gamma_mean, aes(y = mean), alpha = .5) +
#    geom_point(data = mean_rmse, aes(y = statistic),
#               col = "red", pch = 4, cex= 3)

## ----log-linear-fit, eval = eval_chunks----------------------------------
#  log_linear_model <- perf_mod(rmses, transform = ln_trans, seed = 74)

## ----log-linear, eval = eval_chunks--------------------------------------
#  log_linear_post <- tidy(log_linear_model, seed = 3750)
#  
#  log_linear_mean <- summary(log_linear_post)
#  log_linear_mean
#  
#  ggplot(log_linear_post) +
#    geom_point(data = log_linear_mean, aes(y = mean), alpha = .5) +
#    geom_point(data = mean_rmse, aes(y = statistic),
#               col = "red", pch = 4, cex= 3)

## ----linear-linear, eval = eval_chunks-----------------------------------
#  linear_model <- perf_mod(rmses, seed = 74)
#  
#  linear_post <- tidy(linear_model, seed = 3750)
#  linear_mean <- summary(linear_post)
#  
#  ggplot(linear_post) +
#    geom_point(data = linear_mean, aes(y = mean), alpha = .5) +
#    geom_point(data = mean_rmse, aes(y = statistic),
#               col = "red", pch = 4, cex= 3)

## ----gamma-contrast, eval = eval_chunks----------------------------------
#  all_contrasts <- contrast_models(linear_model, seed = 8967)
#  ggplot(all_contrasts, size = 1)
#  summary(all_contrasts, size = 1)

