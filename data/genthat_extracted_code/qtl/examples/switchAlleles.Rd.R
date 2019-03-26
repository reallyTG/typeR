library(qtl)


### Name: switchAlleles
### Title: Switch alleles at selected markers
### Aliases: switchAlleles
### Keywords: utilities

### ** Examples

data(fake.f2)
geno.crosstab(fake.f2, "D5M391", "D5M81")

# switch homozygotes at marker D5M391
fake.f2 <- switchAlleles(fake.f2, "D5M391")

geno.crosstab(fake.f2, "D5M391", "D5M81")

## Not run: 
##D fake.f2 <- est.rf(fake.f2)
##D checkAlleles(fake.f2)
## End(Not run)



