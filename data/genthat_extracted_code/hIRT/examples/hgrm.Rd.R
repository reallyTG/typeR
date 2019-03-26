library(hIRT)


### Name: hgrm
### Title: Fitting Hierarchical Graded Response Models
### Aliases: hgrm

### ** Examples

y <- nes_econ2008[, -(1:3)]
x <- model.matrix( ~ party * educ, nes_econ2008)
z <- model.matrix( ~ party, nes_econ2008)
nes_m1 <- hgrm(y, x, z)
print(nes_m1)



