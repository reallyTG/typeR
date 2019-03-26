library(ammistability)


### Name: MASI.AMMI
### Title: Modified AMMI Stability Index
### Aliases: MASI.AMMI

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
MASI.AMMI(model)

# With n = 4 and default ssi.method (farshadfar)
MASI.AMMI(model, n = 4)

# With default n (N') and ssi.method = "rao"
MASI.AMMI(model, ssi.method = "rao")

# Changing the ratio of weights for Rao's SSI
MASI.AMMI(model, ssi.method = "rao", a = 0.43)

# ASI.AMMI same as MASI.AMMI with n = 2

a <- ASI.AMMI(model)
b <- MASI.AMMI(model, n = 2)

identical(a$ASI, b$MASI)




