library(ammistability)


### Name: ammistability
### Title: Estimate multiple AMMI model Stability Parameters
### Aliases: ammistability

### ** Examples

library(agricolae)
data(plrv)

# AMMI model
model <- with(plrv, AMMI(Locality, Genotype, Rep, Yield, console = FALSE))

ammistability(model, AMGE = TRUE, ASI = FALSE, ASV = TRUE, ASTAB = FALSE,
              AVAMGE = FALSE, DA = FALSE, DZ = FALSE, EV = TRUE,
              FA = FALSE, MASI = FALSE, MASV = TRUE, SIPC = TRUE,
              ZA = FALSE)



