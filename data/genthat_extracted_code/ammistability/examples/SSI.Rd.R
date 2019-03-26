library(ammistability)


### Name: SSI
### Title: Simultaneous Selection Indices for Yield and Stability
### Aliases: SSI

### ** Examples

library(agricolae)
data(plrv)
model <- with(plrv, AMMI(Locality, Genotype, Rep, Yield, console=FALSE))

yield <- aggregate(model$means$Yield, by= list(model$means$GEN),
               FUN=mean, na.rm=TRUE)[,2]
stab <- DZ.AMMI(model)$DZ
genotypes <- rownames(DZ.AMMI(model))

# With default ssi.method (farshadfar)
SSI(y = yield, sp = stab, gen = genotypes)

# With  ssi.method = "rao"
SSI(y = yield, sp = stab, gen = genotypes, method = "rao")

# Changing the ratio of weights for Rao's SSI
SSI(y = yield, sp = stab, gen = genotypes, method = "rao", a = 0.43)




