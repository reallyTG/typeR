library(BICORN)


### Name: data_integration
### Title: Data Initialization for BICORN
### Aliases: data_integration
### Keywords: Initialization

### ** Examples


# load in the sample data input
data("sample.input")

# Data initialization (Integerate prior binding network and gene expression data)
BICORN_input<-data_integration(Binding_matrix = Binding_matrix, Binding_TFs = Binding_TFs,
Binding_genes = Binding_genes, Exp_data = Exp_data, Exp_genes = Exp_genes,
Minimum_gene_per_module_regulate = 2)



