library(pcnetmeta)


### Name: nma.ab.bin
### Title: Arm-Based Network Meta-Analysis for Binary Outcomes
### Aliases: nma.ab.bin

### ** Examples

data(smoke)

# For the smoke cessation data,
# higher event rate indicates better treatment

# use the model = "het_cor"
#set.seed(1234)
#het.cor.out <- nma.ab.bin(s.id, t.id, r, n, data = smoke,
#  trtname = c("NC", "SH", "IC", "GC"), param = c("AR", "OR", "RR", "LOR",
#  "LRR", "RD", "rank.prob"), model = "het_cor", higher.better = TRUE,
#  n.iter = 200000, n.thin = 1, conv.diag = TRUE, dic = TRUE,
#  trace = c("AR", "LOR"), postdens = TRUE)

# use the model = "hom_eqcor"
# increase n.iter to reach convergence
# increase n.adapt to enhance efficiency
set.seed(1234)
hom.eqcor.out <- nma.ab.bin(s.id, t.id, r, n, data = smoke,
  param = c("AR", "LRR"), model = "hom_eqcor", prior.type = "unif", c = 10,
  higher.better = TRUE, n.adapt = 400, n.iter = 100, n.chains = 1)



