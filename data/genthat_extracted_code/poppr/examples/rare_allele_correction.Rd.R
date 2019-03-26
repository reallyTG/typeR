library(poppr)


### Name: rare_allele_correction
### Title: Correcting rare allele frequencies
### Aliases: rare_allele_correction

### ** Examples

## Not run: 
##D 
##D data(Pram)
##D #-------------------------------------
##D 
##D # If you set correction = FALSE, you'll notice the zero-valued alleles
##D 
##D rraf(Pram, correction = FALSE)
##D 
##D # By default, however, the data will be corrected by 1/n
##D 
##D rraf(Pram)
##D 
##D # Of course, this is a diploid organism, we might want to set 1/2n
##D 
##D rraf(Pram, mul = 1/2)
##D 
##D # To set MAF = 1/2mlg
##D 
##D rraf(Pram, d = "mlg", mul = 1/2)
##D 
##D # Another way to think about this is, since these allele frequencies were
##D # derived at each locus with different sample sizes, it's only appropriate to
##D # correct based on those sample sizes.
##D 
##D rraf(Pram, d = "rrmlg", mul = 1/2)
##D 
##D # If we were going to use these frequencies for simulations, we might want to
##D # ensure that they all sum to one. 
##D 
##D rraf(Pram, d = "mlg", mul = 1/2, sum_to_one = TRUE) 
##D 
##D #-------------------------------------
##D # When we calculate these frequencies based on population, they are heavily
##D # influenced by the number of observed mlgs. 
##D 
##D rraf(Pram, by_pop = TRUE, d = "rrmlg", mul = 1/2)
##D 
##D # This can be fixed by specifying a specific value
##D 
##D rraf(Pram, by_pop = TRUE, e = 0.01)
##D 
## End(Not run)



