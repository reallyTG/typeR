library(agricolae)


### Name: stability.par
### Title: Stability analysis. SHUKLA'S STABILITY VARIANCE AND KANG'S
### Aliases: stability.par
### Keywords: models

### ** Examples

library(agricolae)
# example 1
# Experimental data,
# replication rep= 4
# Mean square error, MSerror = 1.8
# 12 environment
# 17 genotype  = 1,2,3,.., 17
# yield averages of 13 genotypes in localities
f <- system.file("external/dataStb.csv", package="agricolae")
dataStb<-read.csv(f)
stability.par(dataStb, rep=4, MSerror=1.8, alpha=0.1, main="Genotype",console=TRUE)

#example 2 covariable. precipitation
precipitation<- c(1000,1100,1200,1300,1400,1500,1600,1700,1800,1900,2000,2100)
stability.par(dataStb, rep=4, MSerror=1.8, alpha=0.1, main="Genotype",
 cova=TRUE, name.cov="Precipitation", file.cov=precipitation,console=TRUE)



