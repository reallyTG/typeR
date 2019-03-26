library(strataG)


### Name: gtypes-class
### Title: 'gtypes' Class
### Aliases: gtypes-class gtypes

### ** Examples


#--- create a diploid (microsatellite) gtypes object
data(dolph.msats)
data(dolph.strata)
strata.schemes <- dolph.strata[, c("broad", "fine")]
rownames(strata.schemes) <- dolph.strata$id
msats.g <- new("gtypes", gen.data = dolph.msats[, -1], ploidy = 2,
               ind.names = dolph.msats[, 1], schemes = strata.schemes)
msats.g

#--- create a haploid sequence (mtDNA) gtypes object and label haplotypes
data(dolph.seqs)
dloop.haps <- cbind(dLoop = dolph.strata$id)
rownames(dloop.haps) <- dolph.strata$id
dloop.g <- new("gtypes", gen.data = dloop.haps, ploidy = 1, 
               schemes = strata.schemes, sequences = dolph.seqs, 
               strata = "fine")
dloop.g
dloop.g <- labelHaplotypes(dloop.g, "Hap.")$gtypes
dloop.g




