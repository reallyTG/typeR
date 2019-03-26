library(netmeta)


### Name: netmeta
### Title: Network meta-analysis using graph-theoretical method
### Aliases: netmeta
### Keywords: Network meta-analysis

### ** Examples

data(Senn2013)

#
# Conduct fixed effects network meta-analysis
#
net1 <- netmeta(TE, seTE, treat1, treat2, studlab,
                data=Senn2013, sm="MD",
                comb.random=FALSE)
net1
net1$Q.decomp

#
# Comparison with reference group
#
print(net1, reference="plac")

#
# Conduct random effects network meta-analysis
#
net2 <- netmeta(TE, seTE, treat1, treat2, studlab,
                data=Senn2013, sm="MD",
                comb.fixed=FALSE)
net2

#
# Change printing order of treatments with placebo last and
# use long treatment names
#
trts <- c("acar", "benf", "metf", "migl", "piog",
          "rosi", "sita", "sulf", "vild", "plac")
net3 <- netmeta(TE, seTE, treat1.long, treat2.long, studlab,
                data=Senn2013, sm="MD", comb.fixed=FALSE,
                seq=trts, reference="Placebo")
print(summary(net3), digits=2)



