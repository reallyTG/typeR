library(bisect)


### Name: bisect_semi_suprevised
### Title: Add together two numbers.
### Aliases: bisect_semi_suprevised

### ** Examples

## Randomly choose samples to be used as known
n_known_samples <- 50
known_samples_indices <- sample.int(nrow(baseline_GSE40279), size = n_known_samples)
known_samples <- as.matrix(baseline_GSE40279[known_samples_indices, ])

## Fit a dirichlet distribution to known samples to use as prior
fit_dirichlet <- sirt::dirichlet.mle(as.matrix(known_samples))
alpha <- fit_dirichlet$alpha

## Prepare the 4 needed matrices
methylation_known <- methylation_GSE40279[known_samples_indices, ]
methylation_unknown <-methylation_GSE40279[-known_samples_indices, ]
total_known <- total_reads_GSE40279[known_samples_indices, ]
total_unknown <- total_reads_GSE40279[-known_samples_indices, ]

## Run Bisect. You should use around 200 iterations. I choose than to accelarate the example.
results <- bisect_semi_suprevised(methylation_unknown, total_unknown,
                                  methylation_known, total_known,
                                  known_samples, alpha, iterations = 10)



