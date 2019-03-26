library(poppr)


### Name: rrmlg
### Title: Round Robin Multilocus Genotypes
### Aliases: rrmlg

### ** Examples


# Find out the round-robin multilocus genotype assignments for P. ramorum
data(Pram)
pmlg_rr <- rrmlg(Pram)
head(pmlg_rr)
## Not run: 
##D # You can find out how many unique genotypes are found without each locus:
##D 
##D colSums(!apply(pmlg_rr, 2, duplicated))
## End(Not run)



