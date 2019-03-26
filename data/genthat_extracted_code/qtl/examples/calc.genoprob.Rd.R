library(qtl)


### Name: calc.genoprob
### Title: Calculate conditional genotype probabilities
### Aliases: calc.genoprob
### Keywords: utilities

### ** Examples

data(fake.f2)
## Don't show: 
fake.f2 <- subset(fake.f2,chr=18:19)
## End(Don't show)fake.f2 <- calc.genoprob(fake.f2, step=2, off.end=5)

data(fake.bc)
## Don't show: 
fake.bc <- subset(fake.bc,chr=18:19)
## End(Don't show)fake.bc <- calc.genoprob(fake.bc, step=0, off.end=0, err=0.01)



