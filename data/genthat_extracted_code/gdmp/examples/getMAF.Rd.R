library(gdmp)


### Name: getMAF
### Title: Return frequency of the minor allele of a SNP
### Aliases: getMAF

### ** Examples

set.seed(002016)
snpG.1 <- c(rep(0, 100), rep(1, 80), rep(2, 9))
snpG.2 <- c(rep(0, 100), rep(1, 80))
snpG.3 <- c(rep(0, 100), rep(2, 9))
snpG.4 <- c(rep(0, 100))

getMAF(snpG.1)
#        0
#0.2592593

getMAF(snpG.2)
#        1
#0.2222222

getMAF(snpG.3)
#         0
#0.08256881

getMAF(snpG.3)




