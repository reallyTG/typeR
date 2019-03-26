library(tsbox)


### Name: ts_pick
### Title: Pick Series (Experimental)
### Aliases: ts_pick

### ** Examples

# Interactive use
## No test: 
ts_plot(ts_pick(
  EuStockMarkets, 
  `My Dax` = "DAX", 
  `My Smi` = "SMI"
))
head(ts_pick(EuStockMarkets, c(1, 2)))
head(ts_pick(EuStockMarkets, `My Dax` = 'DAX', `My Smi` = 'SMI'))
## End(No test)

# Programming use
to.be.picked.and.renamed <- c(`My Dax` = "DAX", `My Smi` = "SMI")
head(ts_pick(EuStockMarkets, to.be.picked.and.renamed))



