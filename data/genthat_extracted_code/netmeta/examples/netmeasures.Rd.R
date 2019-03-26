library(netmeta)


### Name: netmeasures
### Title: Measures for characterizing a network meta-analysis
### Aliases: netmeasures
### Keywords: Network meta-analysis

### ** Examples

data(Senn2013)

#
# Conduct fixed effects network meta-analysis with
# reference treatment 'plac', i.e. placebo
#
net1 <- netmeta(TE, seTE, treat1, treat2, studlab,
                data=Senn2013, sm="MD", reference="plac",
                comb.random=FALSE)

#
# Calculate measures based on a fixed effects model
#        
nm1 <- netmeasures(net1)

#
# Plot of minimal parallelism versus mean path length
#
plot(nm1$meanpath, nm1$minpar, pch="",
     xlab="Mean path length", ylab="Minimal parallelism")
text(nm1$meanpath, nm1$minpar, names(nm1$meanpath), cex=0.8)

# Conduct random effects network meta-analysis with
# reference treatment 'plac', i.e. placebo
#
net2 <- netmeta(TE, seTE, treat1, treat2, studlab,
                data=Senn2013, sm="MD", reference="plac",
                comb.fixed=FALSE)

#
# Calculate measures based on a random effects model
#                          
nm2 <- netmeasures(net2)



