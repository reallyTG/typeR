library(netmeta)


### Name: decomp.design
### Title: Design-based decomposition of Cochran's Q in network
###   meta-analysis
### Aliases: decomp.design
### Keywords: Network meta-analysis Cochran's Q Inconsistency

### ** Examples
                                                                      
data(Senn2013)

#
# Generation of an object of class 'netmeta' with
# reference treatment 'plac', i.e. placebo
#
net1 <- netmeta(TE, seTE, treat1, treat2, studlab,
                data=Senn2013, sm="MD", reference="plac")

#
# Decomposition of Cochran's Q
#
decomp.design(net1)



