library(qtl)


### Name: checkAlleles
### Title: Identify markers with switched alleles
### Aliases: checkAlleles
### Keywords: utilities

### ** Examples

data(fake.f2)
## Don't show: 
fake.f2 <- subset(fake.f2, chr="5")
## End(Don't show)

# switch homozygotes at marker D5M391
fake.f2 <- switchAlleles(fake.f2, "D5M391")

fake.f2 <- est.rf(fake.f2)
checkAlleles(fake.f2)



