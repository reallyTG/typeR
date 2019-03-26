library(netmeta)


### Name: forest.netsplit
### Title: Forest plot for direct and indirect evidence
### Aliases: forest.netsplit
### Keywords: plot Forest plot Inconsistency

### ** Examples

data(Senn2013)
#
net1 <- netmeta(TE, seTE, treat1.long, treat2.long,
                studlab, data = Senn2013,
                comb.fixed = FALSE)
#
ns1 <- netsplit(net1)

# Forest plot showing comparisons contributing both direct and
# indirect evidence
#
forest(ns1, fontsize = 6, spacing = 0.5, addrow.subgroups = FALSE)


# Forest plot showing comparisons contributing direct evidence
#
forest(ns1, fontsize = 6, spacing = 0.5, addrow.subgroups = FALSE,
       show = "with.direct")



