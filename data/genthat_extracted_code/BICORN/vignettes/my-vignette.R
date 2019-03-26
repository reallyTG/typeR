## ----eval=F--------------------------------------------------------------
#  #Load the binary binding network
#  Binding_matrix <- as.matrix(read.table('path_to_prior_bindings/prior_bidnings.txt', row.names = 1, header= TRUE))
#  
#  #Extract TF symbols
#  Binding_TFs = colnames(Binding_matrix)
#  
#  #Extract Gene symbols (can be redundant)
#  Binding_genes = rownames(Binding_matrix)
#  

## ----eval=F--------------------------------------------------------------
#  #Load normalized gene expression data
#  Exp_data <- as.matrix(read.table('path_to_gene_expression/gene_expression.txt', row.names = 1, header= TRUE))
#  
#  #Extract gene symbols
#  Exp_genes=rownames(Exp_data)
#  

## ----eval = F------------------------------------------------------------
#  library(BICORN)
#  
#  data(sample.input)

## ----eval = F------------------------------------------------------------
#  # Integerate the binary binding network and gene expression data
#  BICORN_input<-data_integration(Binding_matrix, Binding_TFs, Binding_genes, Exp_data, Exp_genes, Minimum_gene_per_module_regulate = 2)

## ----eval = F------------------------------------------------------------
#  
#  # Infer cis-regulatory modules and their target genes
#  BICORN_output<-BICORN(BICORN_input, L =100, output_threshold = 10)
#  

## ----eval = F------------------------------------------------------------
#  
#  # Output candidate cis-regulatory modules
#  write.csv(BICORN_output$Modules, file = 'BICORN_cis_regulatory_modules.csv', quote = FALSE)
#  
#  # Output a weighted module-gene regulatory network
#  write.csv(BICORN_output$Posterior_module_gene_regulatory_network, file = 'BICORN_module2target_regulatory_network.csv', quote = FALSE)
#  
#  # Output a weighted TF-gene regulatory network
#  write.csv(BICORN_output$Posterior_TF_gene_regulatory_network, file = 'BICORN_TF2gene_regulatory_network.csv', quote = FALSE)

