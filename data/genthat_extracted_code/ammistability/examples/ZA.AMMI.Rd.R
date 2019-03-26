library(ammistability)


### Name: ZA.AMMI
### Title: Absolute Value of the Relative Contribution of IPCs to the
###   Interaction
### Aliases: ZA.AMMI

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

# With default n (N') and default ssi.method (farshadfar)
ZA.AMMI(model)

# With n = 4 and default ssi.method (farshadfar)
ZA.AMMI(model, n = 4)

# With default n (N') and ssi.method = "rao"
ZA.AMMI(model, ssi.method = "rao")

# Changing the ratio of weights for Rao's SSI
ZA.AMMI(model, ssi.method = "rao", a = 0.43)




