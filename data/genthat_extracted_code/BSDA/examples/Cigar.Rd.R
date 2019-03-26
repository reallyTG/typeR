library(BSDA)


### Name: Cigar
### Title: Milligrams of tar in 25 cigarettes selected randomly from 4
###   different brands
### Aliases: Cigar
### Keywords: datasets

### ** Examples


boxplot(tar ~ brand, data = Cigar, col = "cyan", ylab = "mg tar")
anova(lm(tar ~ brand, data = Cigar))




