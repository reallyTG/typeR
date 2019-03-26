library(JAGUAR)


### Name: jaguar_gwa
### Title: Perform genome-wide analysis
### Aliases: jaguar_gwa
### Keywords: score test statistic joint score test genotype eQTL
###   interaction

### ** Examples

# Load the example data
data(jaguar_example);

# Run a cis analysis with no permutations
Gene_Mat = as.matrix(jaguar_example$GENE_EXP[1:10,])
Geno_Mat = as.matrix(jaguar_example$GENO_MAT)
out = jaguar_gwa(Gene_Mat,Geno_Mat);
dim(out)




