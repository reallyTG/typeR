library(gggenes)


### Name: geom_gene_arrow
### Title: A 'ggplot2' geom to draw genes as arrows
### Aliases: geom_gene_arrow

### ** Examples


ggplot2::ggplot(example_genes, ggplot2::aes(xmin = start, xmax = end,
                                            y = molecule, fill = gene)) +
geom_gene_arrow() +
ggplot2::facet_wrap(~ molecule, scales = "free")




