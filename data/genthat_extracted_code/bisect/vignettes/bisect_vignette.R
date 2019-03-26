## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(bisect)

methylation <- as.matrix(methylation_GSE40279)
total_reads <- as.matrix(total_reads_GSE40279)

dim(methylation)
dim(total_reads)

total_reads_GSE40279[1:10, 1:5]

## ------------------------------------------------------------------------
dim(reference_blood)
reference_blood[1:10, ]

Pi <- as.matrix(reference_blood[,-1]) # For running Bisect we don't need the cg IDs, and we need the reference as a matrix.

## ------------------------------------------------------------------------
print(alpha_blood)

## ---- cache=T------------------------------------------------------------
results <- bisect_supervised(methylation, total_reads, Pi, alpha_blood, iterations = 200)

head(results)

## ---- fig.width=7--------------------------------------------------------
library(dplyr)
library(ggplot2)
library(tidyr)

# organizing the results to a data.frame that works with ggplot2
get_visualization_dataframe <- function(bisect_results, true_cell_counts) {
    estimates_bin <- as.data.frame(bisect_results)
    true_cell_counts <- as.data.frame(true_cell_counts)

    colnames(estimates_bin) <- c("CD4", "CD8", "mono", "Bcells", "NK", "gran")
    colnames(true_cell_counts) <- c("CD4", "CD8", "mono", "Bcells", "NK", "gran")

    gathered_estimates_bin <- estimates_bin %>% gather("CD4", "CD8", "mono", "Bcells", "NK", "gran", key = "cell_type", value = "estimate_norm")
    gathered_truth <- true_cell_counts %>% gather("CD4", "CD8", "mono", "Bcells", "NK", "gran", key = "cell_type", value = "truth")

    gathered_estimates_bin <- gathered_estimates_bin %>% mutate(method = "bin")
    colnames(gathered_estimates_bin) <- c("cell_type", "estimate", "method")

    estimates <- rbind(gathered_estimates_bin)
    truth <- rbind(gathered_truth, gathered_truth)

    results <- cbind(truth, select(estimates, "estimate", "method"))

    return(results)
}

visualization_result <- get_visualization_dataframe(results, baseline_GSE40279)

# plot a scatter plot of true cell types vs estimated.  Looks pretty good!
visualization_result %>% ggplot(aes(truth, estimate, color=cell_type)) + geom_point(size=0.2, alpha = 0.4) + 
  geom_abline(intercept = 0, slope = 1) + xlab("True Cell Proportion") + ylab("Estimated Cell Proportion") + 
  guides(colour = guide_legend(override.aes = list(size=10))) + scale_color_discrete(name = "Cell Type")

## ------------------------------------------------------------------------
set.seed(4321)

# Choose 50 random individuals with known cell type composition
n_known_samples <- 50
known_samples_indices <- sample.int(nrow(baseline_GSE40279), size = n_known_samples)   
known_samples <- as.matrix(baseline_GSE40279[known_samples_indices, ])

## ------------------------------------------------------------------------
# Fit a dirichlet distirbutio nto the known samples to use as a prior
fit_dirichlet <- sirt::dirichlet.mle(as.matrix(known_samples))
alpha <- fit_dirichlet$alpha

## ------------------------------------------------------------------------
# Organize all the matrices such that the known samples are the first 50 rows.
methylation_known <- methylation_GSE40279[known_samples_indices, ]
methylation_unknown <-methylation_GSE40279[-known_samples_indices, ]
total_known <- total_reads_GSE40279[known_samples_indices, ]
total_unknown <- total_reads_GSE40279[-known_samples_indices, ]

# Run Bisect, making sure to supply the number of known individuals.
results <- bisect_semi_suprevised(methylation_unknown, total_unknown, methylation_known, total_known, known_samples, alpha, iterations = 200)

## ---- fig.width=7--------------------------------------------------------
library(ggplot2)

visualization_result <- get_visualization_dataframe(results$P, baseline_GSE40279[-known_samples_indices,])

# plot a scatter plot of true cell types vs estimated.  Looks pretty good!
visualization_result %>% ggplot(aes(truth, estimate, color=cell_type)) + geom_point(size=0.2, alpha = 0.4) + 
  geom_abline(intercept = 0, slope = 1) + xlab("True Cell Proportion") + ylab("Estimated Cell Proportion") + 
  guides(colour = guide_legend(override.aes = list(size=10))) + scale_color_discrete(name = "Cell Type")

## ------------------------------------------------------------------------
estimated_reference <- results$Pi

head(estimated_reference)

# mean correlation between change of methylation and real change of mehylation.
mean(diag(cor(estimated_reference, reference_blood[,-1])))

