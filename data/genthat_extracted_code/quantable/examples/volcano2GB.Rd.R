library(quantable)


### Name: volcano2GB
### Title: Volcano with more control
### Aliases: volcano2GB

### ** Examples

rm(list=ls())

library(ggrepel)
library(quantable)
foldchange <- rnorm(1000)
pvals <-rexp(1000)
names <- sample(colors(),1000,replace=TRUE)

dataX <- data.frame(q.mod = pvals,
 log2FC = foldchange,
  names = names )
  
volcano2GB(dataX)
b <- volcano2GB(dataX, pthresh=0.1, log2FCThresh=0.5 ,
 main='test', repel.segment.size=0.3,repel.text.size=2)
b



