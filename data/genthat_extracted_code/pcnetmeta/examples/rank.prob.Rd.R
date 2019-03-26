library(pcnetmeta)


### Name: rank.prob
### Title: Plotting Treatment Rank Probabilities
### Aliases: rank.prob

### ** Examples

data(smoke)
# increase n.iter to reach convergence
# increase n.adapt to enhance efficiency
set.seed(1234)
nma.out <- nma.ab.bin(s.id, t.id, r, n, data = smoke,
  trtname = c("NC", "SH", "IC", "GC"), param= "rank.prob", model = "het_cor",
  higher.better = TRUE, n.adapt = 400, n.iter = 100, n.chains = 1)
rank.prob(nma.out)



