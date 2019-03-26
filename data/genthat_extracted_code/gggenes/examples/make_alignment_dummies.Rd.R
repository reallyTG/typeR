library(gggenes)


### Name: make_alignment_dummies
### Title: Prepare dummy data to visually align a single gene across
###   faceted molecules
### Aliases: make_alignment_dummies

### ** Examples


dummies <- make_alignment_dummies(example_genes, ggplot2::aes(xmin = start,
  xmax = end, y = molecule, id = gene), on = "genE")

ggplot2::ggplot(example_genes, ggplot2::aes(xmin = start, xmax = end,
    y = molecule, fill = gene)) +
  geom_gene_arrow() +
  ggplot2::geom_blank(data = dummies) +
  ggplot2::facet_wrap(~ molecule, scales = "free", ncol = 1)




