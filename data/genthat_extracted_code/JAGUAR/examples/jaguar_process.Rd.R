library(JAGUAR)


### Name: jaguar_process
### Title: Obtain significant gene-SNP pairs based on a predetermined
###   threshold value
### Aliases: jaguar_process
### Keywords: score test GWAS eQTL

### ** Examples

## Example
# 
# Load the example data
data(jaguar_example);

# Genome-wide analysis
Gene_Mat = as.matrix(jaguar_example$GENE_EXP[1:10,])
Geno_Mat = as.matrix(jaguar_example$GENO_MAT)
jag.out = jaguar_gwa(Gene_Mat,Geno_Mat);
dim(jag.out);

# Process results based on a predetermined threshold
result = jaguar_process(jag.out,0.05);
dim(result);



