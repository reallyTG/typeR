library(hIRT)


### Name: coef_item
### Title: Extracting Estimates of Item Parameters from Hierarchical IRT
###   Models.
### Aliases: coef_item coef_item.hgrm coef_item.hltm

### ** Examples

y <- nes_econ2008[, -(1:3)]
x <- model.matrix( ~ party * educ, nes_econ2008)
z <- model.matrix( ~ party, nes_econ2008)
nes_m1 <- hgrm(y, x, z)
coef_item(nes_m1)



