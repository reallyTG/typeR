library(quantable)


### Name: volcano2G
### Title: DEPRECATED Volcano plot using ggplot and ggrepel
### Aliases: volcano2G

### ** Examples

rm(list=ls())
library(quantable)
foldchange <- rnorm(1000)
pvals <-rexp(1000)
volcano2G(foldchange, pvals,labels=rep("abcde", length(pvals)),
  pthresh=0.1, log2FCThresh=0.5,main='test',size=2,segment.size=0.3)




