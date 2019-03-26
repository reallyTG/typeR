library(netmeta)


### Name: Dong2013
### Title: Network meta-analysis for chronic obstructive pulmonary disease
### Aliases: Dong2013
### Keywords: datasets

### ** Examples

data(Dong2013)

# Only consider first ten studies (to reduce runtime of example)
#
first10 <- subset(Dong2013, id <= 10)

# Transform data from long arm-based format to contrast-based format.
# Argument 'sm' has to be used for odds ratio as summary measure; by
# default the risk ratio is used in the metabin function called
# internally.
p1 <- pairwise(treatment, death, randomized, studlab = id,
               data = first10, sm = "OR")

# Conduct Mantel-Haenszel network meta-analysis
netmetabin(p1, ref = "plac")

## Not run: 
##D # Conduct Mantel-Haenszel network meta-analysis for the whole dataset
##D #
##D p2 <- pairwise(treatment, death, randomized, studlab = id,
##D                data = Dong2013, sm = "OR")
##D netmetabin(p2, ref = "plac")
## End(Not run)



