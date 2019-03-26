library(wtest)


### Name: odds.ratio
### Title: Odds Ratio
### Aliases: odds.ratio

### ** Examples

data(diabetes.geno)
data(phenotype1)
y <- as.numeric(phenotype1)
OR.snp4.snp8 <- odds.ratio(diabetes.geno, y, w.order=2, which.marker = c(4,8))
OR.snp4 <- odds.ratio(diabetes.geno, y, w.order = 1, which.marker = 4)



