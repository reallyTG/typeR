library(poppr)


### Name: shufflepop
### Title: Shuffle individuals in a 'genclone' or 'genind' object
###   independently over each locus.
### Aliases: shufflepop

### ** Examples

# load the microbov dataset
data(microbov)
# Let's look at a single population for now. Howsabout Zebu
Zebu <- popsub(microbov, "Zebu")
summary(Zebu)

# Take note of the Number of alleles per population and the Observed
# heterozygosity as we go through each method.

# Permute Alleles: maintain allelic state; heterozygosity varies.
summary(shufflepop(Zebu, method=1))
## Not run: 
##D # Parametric Bootstrap: do not maintain allelic state or heterozygosity
##D summary(shufflepop(Zebu, method=2))
##D 
##D # Non-Parametric Bootstrap: do not maintain allelic state or heterozygosity.
##D summary(shufflepop(Zebu, method=3))
##D 
##D # Multilocus Style: maintain allelic state and heterozygosity.
##D summary(shufflepop(Zebu, method=4))
## End(Not run)



