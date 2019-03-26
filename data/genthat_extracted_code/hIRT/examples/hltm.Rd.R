library(hIRT)


### Name: hltm
### Title: Fitting Hierarchical Latent Trait Models (for Binary Data).
### Aliases: hltm

### ** Examples

y <- nes_econ2008[, -(1:3)]
x <- model.matrix( ~ party * educ, nes_econ2008)
z <- model.matrix( ~ party, nes_econ2008)

# don't run
# nes_m1 <- hgrm(y, x, z)

dichotomize <- function(x) findInterval(x, c(mean(x, na.rm = TRUE)))
y_bin <- as.data.frame(lapply(y, dichotomize))
nes_m1 <- hltm(y_bin, x, z)
print(nes_m1)



