library(cape)


### Name: select.by.ind
### Title: Subset a cross object to include specific individuals
### Aliases: select.by.ind
### Keywords: manip

### ** Examples

data(obesity.cross)
hist(obesity.cross$pheno[,"insulin"], main = "original insulin distribution",
xlab = "insulin (ng/mL)", xlim = c(0, 30))
obesity.cross <- select.by.ind(obesity.cross, "pheno", "insulin < 25")
hist(obesity.cross$pheno[,"insulin"], main = "subset insulin distribution", 
xlab = "insulin (ng/mL)", xlim = c(0, 30))



