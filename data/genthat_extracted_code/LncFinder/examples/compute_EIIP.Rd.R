library(LncFinder)


### Name: compute_EIIP
### Title: Extract the EIIP-derived features
### Aliases: compute_EIIP

### ** Examples

data(demo_DNA.seq)
Seqs <- demo_DNA.seq

EIIP_res <- compute_EIIP(Seqs, label = "NonCoding", spectrum.percent = 0.25,
                         quantile.probs = seq(0, 1, 0.25))




