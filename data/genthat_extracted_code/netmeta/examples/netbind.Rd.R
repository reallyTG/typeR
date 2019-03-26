library(netmeta)


### Name: netbind
### Title: Combine network meta-analysis objects
### Aliases: netbind

### ** Examples

data(Linde2016)

# Only consider studies including Face-to-face PST (to reduce runtime
# of example)
#
face <- subset(Linde2016, id %in% c(16, 24, 49, 118))

# Standard random effects NMA model (with placebo as reference treatment)
#
net1 <- netmeta(lnOR, selnOR, treat1, treat2, id,
                data = face, reference.group = "placebo",
                sm = "OR", comb.fixed = FALSE)

# Additive CNMA model with placebo as inactive component and reference
#
nc1 <- netcomb(net1, inactive = "placebo")

# Combine results of standard NMA and CNMA
#
nb1 <- netbind(nc1, net1,
               name = c("Additive CNMA", "Standard NMA"),
               col.study = c("red", "black"),
               col.square = c("red", "black"))
forest(nb1,
       col.by = "black", addrow.subgroups = FALSE,
       fontsize = 10, spacing = 0.7, squaresize = 0.9,
       label.left = "Favours Placebo",
       label.right = "Favours other")



