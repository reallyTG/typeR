library(LOGICOIL)


### Name: plot_LOGICOIL
### Title: Plot the LOGICOIL scores
### Aliases: plot_LOGICOIL

### ** Examples

library(nnet)
data(pssm)
data(Model_Parameters)
data(LOGICOILfit)

cat("Estimating oligomeric state of coiled-coil sequences\n")
prob.oligo <- EstimateProbability("GCN4wt",
  "MKQLEDKVEELLSKNYHLENEVARLKKLV",
  "abcdefgabcdefgabcdefgabcdefga",
  pssm,
  LOGICOILfit,
  Model_Parameters)

# plot LOGICOIL results obtained from user-defined coiled-coil sequences
plot_LOGICOIL(prob.oligo, "GCN4wt")




