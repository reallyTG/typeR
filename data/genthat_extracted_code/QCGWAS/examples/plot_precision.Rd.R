library(QCGWAS)


### Name: plot_precision
### Title: GWAS Precision Plot
### Aliases: plot_precision
### Keywords: distribution

### ** Examples

  value_SE <- c(0.078, 0.189, 0.077, 0.040, 0.021, 0.072)
  value_N <- c(870, 830, 970, 690, 2200, 870)
  value_labels <- paste("cohort", 1:6)
  
  plot_precision(SE = value_SE, N = value_N,
                 labels = value_labels,
                 save_name = "sample_precision")



