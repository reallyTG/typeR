library(cape)


### Name: rz.transform
### Title: Normalize a vector using rank normalization
### Aliases: rz.transform
### Keywords: internal distribution

### ** Examples

data(obesity.cross)
phenotype <- obesity.cross$pheno[,"glucose"]
norm.pheno <- rz.transform(phenotype)
hist(phenotype, main = "Histogram of Original\nGlucose 
Distribution", xlab = "raw glucose")
hist(norm.pheno, main = "Histogram of Normalized\nGlucose 
Distribution", xlab = "normalized glucose")



