library(QCGWAS)


### Name: plot_skewness
### Title: GWAS Skewness vs. Kurtosis Plot
### Aliases: plot_skewness
### Keywords: distribution

### ** Examples

  value_S <- c(0.05, -0.27, 0.10, 0.11)
  value_K <- c( 6.7,  10.0, 10.1,  6.6)
  value_labels <- paste("cohort", 1:4)

  plot_skewness(skewness = value_S,
                kurtosis = value_K,
                labels = value_labels,
                plot_labels = "outliers",
                save_name = "sample_skewness_kurtosis")



