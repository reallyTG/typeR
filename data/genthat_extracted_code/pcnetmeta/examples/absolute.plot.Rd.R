library(pcnetmeta)


### Name: absolute.plot
### Title: Plotting Treatment-Specific 95% Credible Intervals
### Aliases: absolute.plot

### ** Examples

data(smoke)
# increase n.iter to reach convergence
# increase n.adapt to enhance efficiency
set.seed(1234)
nma.out <- nma.ab.bin(s.id, t.id, r, n, data = smoke,
  trtname = c("NC", "SH", "IC", "GC"), param= "AR",
  model = "het_cor", n.adapt = 400, n.iter = 100, n.chains = 1)
absolute.plot(nma.out)
absolute.plot(nma.out, alphabetic = FALSE)



