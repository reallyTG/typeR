library(pcnetmeta)


### Name: contrast.plot
### Title: Contrast Plot of Relative Effect Sizes
### Aliases: contrast.plot

### ** Examples

data(smoke)
# increase n.iter to reach convergence
# increase n.adapt to enhance efficiency
set.seed(1234)
nma.out <- nma.ab.bin(s.id, t.id, r, n, data = smoke,
  trtname = c("NC", "SH", "IC", "GC"), param= "LOR",
  model = "het_cor", n.adapt = 400, n.iter = 100, n.chains = 1)
contrast.plot(nma.out)



