library(ade4)


### Name: s.hist
### Title: Display of a scatterplot and its two marginal histograms
### Aliases: s.hist
### Keywords: multivariate hplot

### ** Examples

data(rpjdl)
coa1 <- dudi.coa(rpjdl$fau, scannf = FALSE, nf = 4)
s.hist(coa1$li)
s.hist(coa1$li, cgrid = 2, cbr = 3, adj = 0.5, clab = 0)
s.hist(coa1$co, cgrid = 2, cbr = 3, adj = 0.5, clab = 0)



