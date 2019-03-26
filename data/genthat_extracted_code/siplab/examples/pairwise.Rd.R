library(siplab)


### Name: pairwise
### Title: Compute Pairwise Competition Indices
### Aliases: pairwise

### ** Examples

# Hegyi (1974) index (no distance offset, as usual)
summary(pairwise(finpines, maxR = 6, kernel=powers.ker, kerpar =
  list(pi=1, pj=1, pr=1, smark="diameter")))



