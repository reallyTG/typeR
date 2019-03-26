## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
    collapse = TRUE,
    comment = "#>",
    fig.width = 7,
    fig.height = 5,
    fig.align = "center"
)
set.seed(0)

## ----load_libs, warning=FALSE, message=FALSE-----------------------------
library(dplyr)
library(ggplot2)
library(tibble)
library(purrr)
library(broom)
library(ggasym)

## ----make_data-----------------------------------------------------------
n_reps <- 10  # number of measurements per gene
expt_std_dev <- 1.5  # std. dev. of measurements
genes <- c("FAK", "talin", "paxillin", "vinculin", "B1integrin", "kindlin")
# "real" expression levels to be used as the mean in `rnorm`
real_expression_levels <- sample(seq(1, 5, 0.1), length(genes), replace = TRUE)
# create a tibble
expr_data <- tibble(gene = rep(genes, n_reps),
                    real_expr = rep(real_expression_levels, n_reps),
                    rep_num = sort(rep(1:n_reps, length(genes))))
# add in the measured expression values as a normal distribution around the mean
expr_data <- expr_data %>%
    mutate(expt_expr = rnorm(nrow(expr_data),
                             mean = real_expr,
                             sd = expt_std_dev))
head(expr_data)

## ----anova---------------------------------------------------------------
res_aov <- aov(expt_expr ~ gene, data = expr_data)
broom::tidy(res_aov)

## ----tucky---------------------------------------------------------------
tukey_res <- TukeyHSD(res_aov)
tukey_res

## ----prep_results--------------------------------------------------------
asymmat_tib <- asymmetrise_stats(tukey_res)
head(asymmat_tib)

## ----plot_res_basic------------------------------------------------------
ggplot(asymmat_tib, aes(x = x, y = y)) +
    geom_asymmat(aes(fill_tl = estimate, fill_br = -log(adj.p.value))) +
    scale_fill_tl_gradient2(low = "dodgerblue", high = "tomato") +
    scale_fill_br_distiller(type = "seq", palette = "Greens", direction = 1)

## ----plot_res_full-------------------------------------------------------
ggplot(asymmat_tib, aes(x = x, y = y)) +
    geom_asymmat(aes(fill_tl = estimate, fill_br = -log(adj.p.value))) +
    scale_fill_tl_gradient2(low = "dodgerblue", high = "tomato",
                            guide = guide_colourbar(order = 1)) +
    scale_fill_br_distiller(type = "seq", palette = "Greens", direction = 1,
                            guide = guide_colourbar(order = 2)) +
    theme_bw() +
    theme(panel.background = element_rect(fill = "grey50"),
          panel.grid = element_blank(),
          axis.title = element_blank(),
          plot.title = element_text(hjust = 0.5)) +
    labs(title = "Differential Gene Expression",
         fill_tl = "diff. in\nmean expr.",
         fill_br = "-log( adj. p-value )") +
    scale_x_discrete(expand = c(0,0)) +
    scale_y_discrete(expand = c(0,0))

