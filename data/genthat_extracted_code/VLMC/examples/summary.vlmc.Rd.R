library(VLMC)


### Name: summary.vlmc
### Title: Summary of Fitted Variable Length Markov Chain (VLMC)
### Aliases: summary.vlmc print.summary.vlmc
### Keywords: ts models

### ** Examples

data(bnrf1)
vb <- vlmc(bnrf1EB)
svb <- summary(vb)
svb
## Don't show: 
try(## since it currently fails (".. nested too deeply") -- FIXME -- !
  print(svb, vvec.print = TRUE)
)
## End(Don't show)



