library(hIRT)


### Name: coef.hIRT
### Title: Extracting Parameter Estimates from Hierarchical IRT Models.
### Aliases: coef.hIRT coef_mean coef_var

### ** Examples

y <- nes_econ2008[, -(1:3)]
x <- model.matrix( ~ party * educ, nes_econ2008)
z <- model.matrix( ~ party, nes_econ2008)
nes_m1 <- hgrm(y, x, z)
coef(nes_m1)
coef_mean(nes_m1)
coef_var(nes_m1)



