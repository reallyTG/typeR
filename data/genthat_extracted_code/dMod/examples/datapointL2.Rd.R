library(dMod)


### Name: datapointL2
### Title: L2 objective function for validation data point
### Aliases: datapointL2

### ** Examples

prediction <- list(a = matrix(c(0, 1), nrow = 1, dimnames = list(NULL, c("time", "A"))))
derivs <- matrix(c(0, 1, 0.1), nrow = 1, dimnames = list(NULL, c("time", "A.A", "A.k1")))
attr(prediction$a, "deriv") <- derivs
p0 <- c(A = 1, k1 = 2)

vali <- datapointL2(name = "A", time = 0, value = "newpoint", sigma = 1, condition = "a")
vali(pars = c(p0, newpoint = 1), env = .GlobalEnv)



