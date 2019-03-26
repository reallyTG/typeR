library(netmeta)


### Name: netmetabin
### Title: Network meta-analysis of binary outcome data
### Aliases: netmetabin

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
# (without continuity correction)
nb1 <- netmetabin(p1, ref = "plac")
nb1

# Obtain the league table
netleague(nb1)

## Not run: 
##D # Conduct Mantel-Haenszel network meta-analysis for the whole dataset
##D #
##D p2 <- pairwise(treatment, death, randomized, studlab = id,
##D                data = Dong2013, sm = "OR")
##D netmetabin(p2, ref = "plac")
##D   
##D # Conduct network meta-analysis using the non-central hypergeometric
##D # model (without continuity correction)
##D netmetabin(p2, ref = "plac", method = "NCH")
##D 
##D # Conduct Mantel-Haenszel network meta-analysis
##D # (with continuity correction of 0.5; include all studies)
##D netmetabin(p2, ref = "plac", cc.pooled = TRUE)
##D 
##D 
##D data(Gurusamy2011)
##D 
##D p3 <- pairwise(treatment, death, n, studlab = study,
##D                data = Gurusamy2011, sm = "OR")
##D 
##D # Conduct Mantel-Haenszel network meta-analysis
##D # (without continuity correction)
##D netmetabin(p3, ref = "cont")
## End(Not run)



