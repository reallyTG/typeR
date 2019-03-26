library(netmeta)


### Name: Gurusamy2011
### Title: Network meta-analysis on blood loss during liver transplantation
### Aliases: Gurusamy2011
### Keywords: datasets

### ** Examples

data(Gurusamy2011)

# Only consider three studies (to reduce runtime of example)
#
studies <- c("Findlay 2001", "Garcia-Huete 1997", "Dalmau 2000")
three <- subset(Gurusamy2011, study %in% studies)

# Transform data from long arm-based format to contrast-based format.
# Argument 'sm' has to be used for odds ratio as summary measure; by
# default the risk ratio is used in the metabin function called
# internally.
p1 <- pairwise(treatment, death, n, studlab = study,
               data = three, sm = "OR")

# Conduct Mantel-Haenszel network meta-analysis
netmetabin(p1, ref = "cont")

## Not run: 
##D p2 <- pairwise(treatment, death, n, studlab = study,
##D                data = Gurusamy2011, sm = "OR")
##D 
##D # Conduct Mantel-Haenszel network meta-analysis
##D netmetabin(p2, ref = "cont")
## End(Not run)



