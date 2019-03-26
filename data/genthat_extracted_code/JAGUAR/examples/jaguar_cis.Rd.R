library(JAGUAR)


### Name: jaguar_cis
### Title: Perform cis-eQTL analysis
### Aliases: jaguar_cis
### Keywords: score test statistic joint score test genotype eQTL
###   interaction

### ** Examples

# Load the example data
data(jaguar_example);
Gene = jaguar_example$GENE_EXP
SNP = jaguar_example$GENO_MAT
gene_loc = jaguar_example$GENE_BED
snp_loc = jaguar_example$SNP_BED
# Run a cis analysis with no permutations
out = jaguar_cis(Gene,SNP,snp_loc,gene_loc,nperm=0);
length(out)



