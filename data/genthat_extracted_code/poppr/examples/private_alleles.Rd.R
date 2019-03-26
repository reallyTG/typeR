library(poppr)


### Name: private_alleles
### Title: Tabulate alleles the occur in only one population.
### Aliases: private_alleles

### ** Examples


data(Pinf) # Load P. infestans data.
private_alleles(Pinf)

## Not run: 
##D # Analyze private alleles based on the country of interest:
##D private_alleles(Pinf, alleles ~ Country)
##D 
##D # Number of observed alleles per locus
##D private_alleles(Pinf, locus ~ Country, count.alleles = TRUE)
##D 
##D # Get raw number of private alleles per locus.
##D (pal <- private_alleles(Pinf, locus ~ Country, count.alleles = FALSE))
##D 
##D # Get percentages.
##D sweep(pal, 2, nAll(Pinf)[colnames(pal)], FUN = "/")
##D 
##D # An example of how these data can be displayed.
##D library("ggplot2")
##D Pinfpriv <- private_alleles(Pinf, report = "data.frame")
##D ggplot(Pinfpriv) + geom_tile(aes(x = population, y = allele, fill = count))
## End(Not run)



