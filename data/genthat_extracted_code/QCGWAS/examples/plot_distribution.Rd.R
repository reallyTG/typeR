library(QCGWAS)


### Name: plot_distribution
### Title: GWAS effect-Size distribution plot
### Aliases: plot_distribution
### Keywords: distribution

### ** Examples

  data("gwa_sample")

  chunk1 <- gwa_sample$EFFECT[1:1000]
  chunk2 <- gwa_sample$EFFECT[1001:2000]
  chunk3 <- gwa_sample$EFFECT[2001:3000]

  plot_distribution(
    data_table = data.frame(chunk1, chunk2, chunk3),
    names = c("chunk 1", "chunk 2", "chunk 3"),
    quantile_lines = TRUE,
    save_name = "sample_distribution")



