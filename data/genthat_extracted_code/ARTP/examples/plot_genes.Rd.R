library(ARTP)


### Name: plot_genes
### Title: Gene Plot
### Aliases: plot_genes
### Keywords: misc

### ** Examples

 # Get the file of observed p-values
 obs_file <- system.file("sampleData", "obs_pvalues.txt", package="ARTP")

 # Define the gene-SNP list
 gs_file <- system.file("sampleData", "gene_SNP_data.txt", package="ARTP") 
 gene.list <- list(file=gs_file, delimiter="\t", header=1, 
                   snp.var="SNP", gene.var="Gene")
 
 plot_genes(obs_file, gene.list) 
  



