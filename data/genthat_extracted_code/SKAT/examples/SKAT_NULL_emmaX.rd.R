library(SKAT)


### Name: SKAT_NULL_emmaX
### Title: Get parameters and residuals from the null model with
###   incorporating the kinship structure
### Aliases: SKAT_NULL_emmaX

### ** Examples



data(SKAT.fam.example)
attach(SKAT.fam.example)


obj<-SKAT_NULL_emmaX(y ~ X, K=K)
SKAT(Z, obj)$p.value

# SKAT-O
SKAT(Z, obj, method="optimal.adj")$p.value	




