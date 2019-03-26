library(eChem)


### Name: plotCA
### Title: Plot Chronoamperograms
### Aliases: plotCA

### ** Examples

ca_ex1 = simulateCA(conc.bulk = 0.01, x.units = 100, t.units = 1000)
ca_ex2 = simulateCA(conc.bulk = 0.001, x.units = 100, t.units = 1000)
ca_ex3 = simulateCA(conc.bulk = 0.0001, x.units = 100, t.units = 1000)
plotCA(filenames = list(ca_ex1, ca_ex2, ca_ex3),
  legend_text = c("0.01 M", "0.001 M", "0.0001 M"), scale = 0.1)



