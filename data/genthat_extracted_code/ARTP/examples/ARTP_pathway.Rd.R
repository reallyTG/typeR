library(ARTP)


### Name: ARTP_pathway
### Title: Gene and pathway p-values using ARTP
### Aliases: ARTP_pathway
### Keywords: model

### ** Examples

  # Get the file of observed p-values
 obs_file <- system.file("sampleData", "obs_pvalues.txt", package="ARTP")

 # Get the file of permutation p-values
 perm_file <- system.file("sampleData", "perm_pvalues.txt", package="ARTP")

 # Define the gene-SNP list
 gs_file <- system.file("sampleData", "gene_SNP_data.txt", package="ARTP") 
 gene.list <- list(file=gs_file, delimiter="\t", header=1, 
                   snp.var="SNP", gene.var="Gene")

 # Call the ARTP function
 nperm <- 100  # The number of permutations in perm_file
 temp.dir <- "C:/temp/"
 set.seed(123)
 # ARTP_pathway(obs_file, perm_file, nperm, temp.dir, gene.list=gene.list)

 # Now asume that all SNPs belong to the same gene
 # ARTP_pathway(obs_file, perm_file, nperm, temp.dir)




