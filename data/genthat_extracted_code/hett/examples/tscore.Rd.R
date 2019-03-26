library(hett)


### Name: tscore
### Title: Score test for heteroscedastic t models
### Aliases: tscore
### Keywords: regression distribution

### ** Examples


data(mm, package = "hett")
attach(mm)
tfit1 <- tlm(m.marietta ~ CRSP, ~ 1, data = mm, start = list(dof = 3),
estDof = TRUE)

tfit2 <- tlm(m.marietta ~ CRSP, ~ CRSP, data = mm, start = list(dof =
3), estDof = TRUE)

tscore(tfit1, tfit2, data = mm, scale = TRUE)



