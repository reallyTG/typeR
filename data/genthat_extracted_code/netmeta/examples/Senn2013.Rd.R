library(netmeta)


### Name: Senn2013
### Title: Network meta-analysis in diabetes
### Aliases: Senn2013
### Keywords: datasets

### ** Examples

data(Senn2013)

#
# Fixed effect model
#
net1 <- netmeta(TE, seTE, treat1, treat2,
                studlab, data=Senn2013,
                comb.random = FALSE)
net1
net1$Q.decomp

#
# Forest plot
#
forest(net1, ref="plac")

## Not run: 
##D #
##D # Comparison with reference group
##D #
##D netmeta(TE, seTE, treat1.long, treat2.long,
##D         studlab, data=Senn2013, 
##D         reference="plac")
##D 
##D #
##D # Random effects model
##D #
##D net2 <- netmeta(TE, seTE, treat1, treat2, studlab, data=Senn2013,
##D                 comb.fixed = FALSE)
##D net2
##D forest(net2, ref="plac")
## End(Not run)



