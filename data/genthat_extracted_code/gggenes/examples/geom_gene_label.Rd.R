library(gggenes)


### Name: geom_gene_label
### Title: A 'ggplot2' geom to add text labels to gene arrows
### Aliases: geom_gene_label

### ** Examples


ggplot2::ggplot(example_genes, ggplot2::aes(xmin = start, xmax = end,
  y = molecule, fill = gene, label = gene)) +
  geom_gene_arrow() +
  geom_gene_label() +
  ggplot2::facet_wrap(~ molecule, ncol = 1, scales = "free") +
  theme_genes()



