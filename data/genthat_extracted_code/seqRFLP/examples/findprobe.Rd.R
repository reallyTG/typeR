library(seqRFLP)


### Name: findprobe
### Title: Find probes matching sites
### Aliases: findprobe
### Keywords: probe

### ** Examples

### findprobe() example
data(fil.phy)
fas <- ConvFas(fil = fil.phy, type = "phy")
findprobe(dna = fas[2], probe = "TATTTAAC", tol = 1)



