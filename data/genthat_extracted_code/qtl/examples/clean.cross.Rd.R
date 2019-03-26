library(qtl)


### Name: clean.cross
### Title: Remove derived data
### Aliases: clean.cross
### Keywords: manip

### ** Examples

data(fake.f2)
names(fake.f2$geno)
fake.f2 <- calc.genoprob(fake.f2)
names(fake.f2$geno)
fake.f2 <- clean(fake.f2)
names(fake.f2$geno)



