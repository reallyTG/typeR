library(qtl)


### Name: sim.geno
### Title: Simulate genotypes given observed marker data
### Aliases: sim.geno
### Keywords: utilities

### ** Examples

data(fake.f2)
## Don't show: 
fake.f2 <- subset(fake.f2, chr=18:19)
## End(Don't show)
fake.f2 <- sim.geno(fake.f2, step=2, n.draws=8)



