library(qtl)


### Name: effectscan
### Title: Plot estimated QTL effects across the whole genome
### Aliases: effectscan
### Keywords: hplot

### ** Examples

data(fake.f2)
## Don't show: 
fake.f2 <- subset(fake.f2, chr=c(1,13,"X"))
## End(Don't show)
fake.f2 <- sim.geno(fake.f2, step=2.5, n.draws=16)

# allelic effect on whole genome
effectscan(fake.f2)

# on chromosome 13, include standard errors
effectscan(fake.f2, chr="13", mtick="triangle", get.se=TRUE)



