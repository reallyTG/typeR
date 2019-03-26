library(gggenes)


### Name: theme_genes
### Title: A 'ggplot2' theme for drawing gene maps
### Aliases: theme_genes

### ** Examples


ggplot2::ggplot(example_genes, ggplot2::aes(xmin = start, xmax = end,
                                            y = molecule, fill = gene)) +
geom_gene_arrow() +
ggplot2::facet_wrap(~ molecule, scales = "free") +
theme_genes()




