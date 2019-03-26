library(vcfR)


### Name: genetic_diff
### Title: Genetic differentiation
### Aliases: genetic_diff

### ** Examples

data(vcfR_example)
myPops <- as.factor(rep(c('a','b'), each = 9))
myDiff <- genetic_diff(vcf, myPops, method = "nei")
colMeans(myDiff[,c(3:8,11)], na.rm = TRUE)
hist(myDiff$Gprimest, xlab = expression(italic("G'"["ST"])), 
     col='skyblue', breaks = seq(0, 1, by = 0.01))





