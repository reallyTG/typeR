library(netmeta)


### Name: print.netcomb
### Title: Print and summary method for objects of class netcomb
### Aliases: print.netcomb summary.netcomb print.summary.netcomb
### Keywords: print

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
                sm = "OR", comb.fixed = FALSE)

# Additive model for treatment components
#
nc1 <- netcomb(net1)

summary(nc1)
print(summary(nc1), digits = 2, digits.zval = 3)

## Not run: 
##D # Conduct random effects network meta-analysis
##D #
##D net2 <- netmeta(lnOR, selnOR, treat1, treat2, id,
##D                 data = Linde2016, reference.group = "placebo",
##D                 sm = "OR", comb.fixed = FALSE)
##D 
##D # Additive model for treatment components
##D #
##D nc2 <- netcomb(net2)
##D 
##D summary(nc2)
##D print(summary(nc2), digits = 2, digits.zval = 3)
## End(Not run)



