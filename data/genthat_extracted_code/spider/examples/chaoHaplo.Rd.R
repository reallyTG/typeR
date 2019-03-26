library(spider)


### Name: chaoHaplo
### Title: Chao estimator of haplotype number
### Aliases: chaoHaplo
### Keywords: Barcoding

### ** Examples


data(dolomedes)
#Create dataset with multiple copies of Dolomedes haplotypes
doloSamp <- dolomedes[sample(16, 100, replace=TRUE, prob=c(0.85, rep(0.01, 15))), ]

chaoHaplo(doloSamp)




