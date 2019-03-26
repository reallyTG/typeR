library(econullnetr)


### Name: bipartite_stats
### Title: Test for significant differences in a range of network metrics
###   between the observed and null bipartite networks
### Aliases: bipartite_stats

### ** Examples

set.seed(1234)
sil.null <- generate_null_net(Silene[, 2:7], Silene.plants[, 2:6], sims = 10,
                              c.samples = Silene[, 1],
                              r.samples = Silene.plants[, 1])
# Network-level analysis
net.stats <- bipartite_stats(sil.null, index.type = "networklevel",
                             indices = c("linkage density",
                             "weighted connectance", "weighted nestedness",
                             "interaction evenness"), intereven = "sum")
net.stats

# Group-level analysis
grp.stats <- bipartite_stats(sil.null, index.type = "grouplevel",
                             indices = c("generality",
                             "vulnerability", "partner diversity"),
                             logbase = 2)
grp.stats

# Species-level statistics
spp.stats <- bipartite_stats(sil.null, index.type = "specieslevel",
                             indices = c("degree", "normalised degree",
                             "partner diversity"), logbase = exp(1))

spp.stats # Show all data frames of results
spp.stats$normalised.degree # Select one statistic
spp.stats$normalised.degree$lower # Select one statistic at one level




