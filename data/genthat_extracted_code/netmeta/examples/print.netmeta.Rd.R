library(netmeta)


### Name: print.netmeta
### Title: Print and summary method for objects of class netmeta
### Aliases: print.netmeta summary.netmeta print.summary.netmeta
### Keywords: print

### ** Examples

data(Senn2013)

#
# Conduct fixed effects network meta-analysis
#
net1 <- netmeta(TE, seTE, treat1, treat2, studlab,
                data=Senn2013, sm="MD",
                comb.random=FALSE)
print(net1, ref="plac", digits=3)
summary(net1)

#
# Conduct random effects network meta-analysis
#
net2 <- netmeta(TE, seTE, treat1, treat2, studlab,
                data=Senn2013, sm="MD",
                comb.fixed=FALSE)
print(net2, ref="plac", digits=3)
summary(net2)



