library(psychotree)


### Name: SPISA
### Title: SPIEGEL Studentenpisa Data (Subsample)
### Aliases: SPISA
### Keywords: datasets

### ** Examples

## data
data("SPISA", package = "psychotree")

## summary of covariates
summary(SPISA[,-1])

## histogram of raw scores
hist(rowSums(SPISA$spisa), breaks = 0:45 + 0.5)

## Not run: 
##D ## See the following vignette for a tree-based DIF analysis
##D vignette("raschtree", package = "psychotree")
## End(Not run)



