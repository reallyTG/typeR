library(ammistability)


### Name: ASI.AMMI
### Title: AMMI Stability Index
### Aliases: ASI.AMMI

### ** Examples

library(agricolae)
data(plrv)

# AMMI model
model <- with(plrv, AMMI(Locality, Genotype, Rep, Yield, console = FALSE))

# ANOVA
model$ANOVA

# IPC F test
model$analysis

# Mean yield and IPC scores
model$biplot

# G*E matrix (deviations from mean)
array(model$genXenv, dim(model$genXenv), dimnames(model$genXenv))

# With default ssi.method (farshadfar)
ASI.AMMI(model)

# With  ssi.method = "rao"
ASI.AMMI(model, ssi.method = "rao")

# Changing the ratio of weights for Rao's SSI
ASI.AMMI(model, ssi.method = "rao", a = 0.43)




