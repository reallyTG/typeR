library(netmeta)


### Name: Linde2016
### Title: Network meta-analysis of primary care depression treatments
### Aliases: Linde2016
### Keywords: datasets

### ** Examples

data(Linde2016)

# Only consider studies including Face-to-face PST (to reduce runtime
# of example)
#
face <- subset(Linde2016, id %in% c(16, 24, 49, 118))

# Conduct random effects network meta-analysis
#
net1 <- netmeta(lnOR, selnOR, treat1, treat2, id,
                data = face, reference.group = "placebo",
                sm = "OR", comb.fixed = FALSE,
                nchar = 6)
#
summary(net1)

## Not run: 
##D # Conduct random effects network meta-analysis
##D #
##D net2 <- netmeta(lnOR, selnOR, treat1, treat2, id,
##D                 data = Linde2016, reference.group = "placebo",
##D                 sm = "OR", comb.fixed = FALSE,
##D                 nchar = 6)
##D #
##D summary(net2)
## End(Not run)



