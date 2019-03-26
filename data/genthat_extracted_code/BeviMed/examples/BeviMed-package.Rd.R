library(BeviMed)


### Name: BeviMed-package
### Title: Bayesian Evaluation of Variant Involvement in Mendelian Disease
### Aliases: BeviMed-package BeviMed
### Keywords: package, statistical association test, Bayesian inference,
###   rare disease

### ** Examples

# generate random allele count matrix for 10 individuals at 5 rare variant sites
G <- matrix(rbinom(n=50, size=2, prob=0.1), nrow=10, ncol=5)
# generate case/control label whereby individuals with any alleles in the first 
# three variants are labelled cases
y <- apply(G[,1:3], 1, sum) > 0
# apply BeviMed
bevimed(y=y, G=G)



