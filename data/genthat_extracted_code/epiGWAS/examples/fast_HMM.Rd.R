library(epiGWAS)


### Name: fast_HMM
### Title: Fits a HMM to a genotype dataset by calling fastPHASE
### Aliases: fast_HMM

### ** Examples

## Not run: 
##D p <- 50
##D n <- 100
##D genotypes <- matrix((runif(n * p, min = 0, max = 1) < 0.5) +
##D             (runif(n * p, min = 0, max = 1) < 0.5),
##D             nrow = n, dimnames = list(NULL, paste0("SNP_", seq_len(p))))
##D 
##D hmm <- fast_HMM(genotypes, fp_path = "/path/to/fastPHASE",
##D                 n_state = 4, n_iter = 10)
## End(Not run)




