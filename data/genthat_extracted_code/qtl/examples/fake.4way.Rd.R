library(qtl)


### Name: fake.4way
### Title: Simulated data for a 4-way cross
### Aliases: fake.4way
### Keywords: datasets

### ** Examples

data(fake.4way)
## Don't show: 
fake.4way <- subset(fake.4way,chr=c(2,7))
## End(Don't show)
plot(fake.4way)
summary(fake.4way)

# estimate recombination fractions
fake.4way <- est.rf(fake.4way)
plotRF(fake.4way)

# estimate genetic maps
ssmap <- est.map(fake.4way, verbose=TRUE)
samap <- est.map(fake.4way, sex.sp=FALSE, verbose=TRUE)
plot(ssmap, samap)

# error lod scores
fake.4way <- calc.genoprob(fake.4way, err=0.01)
fake.4way <- calc.errorlod(fake.4way, err=0.01)
top.errorlod(fake.4way, cutoff=2.5)

# genome scan
fake.4way <- calc.genoprob(fake.4way, step=2.5)
out.hk <- scanone(fake.4way, method="hk")
out.em <- scanone(fake.4way, method="em")
plot(out.em,out.hk,chr=c(2,7))



