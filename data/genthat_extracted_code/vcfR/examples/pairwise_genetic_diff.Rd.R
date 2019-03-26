library(vcfR)


### Name: pairwise_genetic_diff
### Title: Pairwise genetic differentiation across populations
### Aliases: pairwise_genetic_diff

### ** Examples

data(vcfR_example)
pops <- as.factor(rep(c('a','b'), each = 9))
myDiff <- pairwise_genetic_diff(vcf, pops, method = "nei")
colMeans(myDiff[,c(4:ncol(myDiff))], na.rm = TRUE)
pops <- as.factor(rep(c('a','b','c'), each = 6))
myDiff <- pairwise_genetic_diff(vcf, pops, method = "nei")
colMeans(myDiff[,c(4:ncol(myDiff))], na.rm = TRUE)




