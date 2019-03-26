library(XMRF)


### Name: processSeq
### Title: Process Sequencing Data for Poisson-based MRFs
### Aliases: processSeq

### ** Examples

library(XMRF)
data('brcadat')
brca = t(processSeq(t(brcadat), PercentGenes=1))



