library(cape)


### Name: delete.pheno
### Title: Remove phenotypes from the phenotype matrix
### Aliases: delete.pheno
### Keywords: manip

### ** Examples

data(obesity.cross)
str(obesity.cross)
obesity.cross <- delete.pheno(obesity.cross, "insulin")
str(obesity.cross)



