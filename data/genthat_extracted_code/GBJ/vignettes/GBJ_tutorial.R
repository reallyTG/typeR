## ------------------------------------------------------------------------
library(GBJ)
set.seed(0)
cancer_status <- c(rep(1,500), rep(0,500))

# All of our SNPs have minor allele frequency of 0.3 in this example
genotype_data <- matrix(data=rbinom(n=1000*50, size=2, prob=0.3), nrow=1000)
age <- round( runif(n=1000, min=30, max=80) )
gender <- rbinom(n=1000, size=1, prob=0.5)     # Let 1 denote a female and 0 a male

## ------------------------------------------------------------------------
null_mod <- glm(cancer_status~age+gender, family=binomial(link="logit"))
log_reg_stats <- calc_score_stats(null_model=null_mod, factor_matrix=genotype_data, link_function="logit")
log_reg_stats$test_stats
log_reg_stats$cor_mat[1:5,1:5]

## ------------------------------------------------------------------------
cor_Z <- log_reg_stats$cor_mat
score_stats = log_reg_stats$test_stats
GBJ(test_stats=score_stats, cor_mat=cor_Z)

## ------------------------------------------------------------------------
GHC(test_stats=score_stats, cor_mat=cor_Z)
HC(test_stats=score_stats, cor_mat=cor_Z)
BJ(test_stats=score_stats, cor_mat=cor_Z)
minP(test_stats=score_stats, cor_mat=cor_Z)

## ------------------------------------------------------------------------
# Load the genotype data at FGFR2 SNPs for 91 Great Britain (GBR) subjects from the 1000 Genomes Project (publically available).
data(FGFR2)

# Load PCs for these same 91 subjects (calculated, for example, with EIGENSTRAT)
data(gbr_pcs)

# Suppose we were given the following 64 test statistics for the FGFR2 SNPs (must be the same SNPs that
# are in our genotype matrix!)
FGFR2_stats <- rnorm(n=64)

# Estimate correlation matrix for summary statistics
FGFR2_cor_mat <- estimate_ss_cor(ref_pcs=gbr_pcs, ref_genotypes=FGFR2, link_function='logit')

# Run GBJ
GBJ(test_stats=FGFR2_stats, cor_mat=FGFR2_cor_mat)

