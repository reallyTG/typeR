library(poppr)


### Name: pgen
### Title: Genotype Probability
### Aliases: pgen

### ** Examples

data(Pram)
head(pgen(Pram, log = FALSE))

## Not run: 
##D # You can also supply the observed allele frequencies
##D pramfreq <- Pram %>% genind2genpop() %>% tab(freq = TRUE)
##D head(pgen(Pram, log = FALSE, freq = pramfreq))
##D 
##D # You can get the Pgen values over all loci by summing over the logged results:
##D pgen(Pram, log = TRUE) %>%  # calculate pgen matrix
##D   rowSums(na.rm = TRUE) %>% # take the sum of each row
##D   exp()                     # take the exponent of the results
##D 
##D # You can also take the product of the non-logged results:
##D apply(pgen(Pram, log = FALSE), 1, prod, na.rm = TRUE)
##D 
##D ## Rare Allele Correction ---------------------------------------------------
##D ##
##D # If you don't supply a table of frequencies, they are calculated with rraf 
##D # with correction = TRUE. This is normally benign when analyzing large 
##D # populations, but it can have a great effect on small populations. To help 
##D # control this, you can supply arguments described in 
##D # help("rare_allele_correction"). 
##D 
##D 
##D # Default is to correct by 1/n per population. Since the calculation is 
##D # performed on a smaller sample size due to round robin clone correction, it
##D # would be more appropriate to correct by 1/rrmlg at each locus. This is 
##D # acheived by setting d = "rrmlg". Since this is a diploid, we would want to
##D # account for the number of chromosomes, and so we set mul = 1/2
##D head(pgen(Pram, log = FALSE, d = "rrmlg", mul = 1/2)) # compare with the output above
##D 
##D # If you wanted to treat all alleles as equally rare, then you would set a
##D # specific value (let's say the rare alleles are 1/100):
##D head(pgen(Pram, log = FALSE, e = 1/100))
## End(Not run)



