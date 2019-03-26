library(quantable)


### Name: addSpecialProteins
### Title: add special labels
### Aliases: addSpecialProteins

### ** Examples


foldchange <- rnorm(1000)
pvals <-rexp(1000)
names <- sample(colors(),1000,replace=TRUE)

dataX <- data.frame(
  q.mod = pvals,
  log2FC = foldchange,
  names = names
)
library(rlang)
foldchange = "log2FC"
p <- volcano2GB(dataX, pthresh=0.1, log2FCThresh=0.5 , main='test',
                repel.segment.size=0.3,
                repel.text.size=2)
special <- sample(colors(),5)
p <- addSpecialProteins(p, dataX, special)
p




