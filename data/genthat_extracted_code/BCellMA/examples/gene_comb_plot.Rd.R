library(BCellMA)


### Name: gene_comb_plot
### Title: Plot of gene/gene ratios of two gene families
### Aliases: gene_comb_plot

### ** Examples

data(IMGTtab1)
gane_comb<-gene_comb_funk(family1 = IMGTtab1$V_GENE_and_allele,
                          family2 = IMGTtab1$J_GENE_and_allele)
gene_comb_plot(gane_comb, "Plot of IGHV and IGHJ ratio", legend_position = "right", a = 35, b = 0.5)



