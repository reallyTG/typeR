library(ABC.RAP)


### Name: plot_gene
### Title: Plotting and exporting methylation profile for candidate genes
### Aliases: plot_gene

### ** Examples

 
data(test_data)
data(nonspecific_probes)
data(annotation_file)
test_data_filtered <- filter_data(test_data)
test_data_annotated <- annotate_data(test_data_filtered)
KLHL34 <- plot_gene(test_data_annotated, 'KLHL34', 1, 2, 3, 4)




