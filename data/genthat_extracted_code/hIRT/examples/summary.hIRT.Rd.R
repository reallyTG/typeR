library(hIRT)


### Name: summary.hIRT
### Title: Summarizing Hierarchical Item Response Theory Models
### Aliases: summary.hIRT print.summary_hIRT

### ** Examples

y <- nes_econ2008[, -(1:3)]
x <- model.matrix( ~ party * educ, nes_econ2008)
z <- model.matrix( ~ party, nes_econ2008)
nes_m1 <- hgrm(y, x, z)
summary(nes_m1, by_item = TRUE)



