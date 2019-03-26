library(kergp)


### Name: covTS
### Title: Creator Function for 'covTS' Objects
### Aliases: covTS

### ** Examples

myCov1 <- covTS(kernel = "k1Exp", inputs = c("v1", "v2", "v3"),
                dep = c(range = "input"))
coef(myCov1) <- c(range = c(0.3, 0.7, 0.9), sigma2 = c(2, 2, 8))

myCov1
coef(myCov1)
coef(myCov1, as = "matrix")
coef(myCov1, as = "list")
coef(myCov1, as = "matrix", type = "range")

# with a common range parameter
myCov2 <- covTS(kernel = "k1Exp", inputs = c("v1", "v2", "v3"), 
                dep = c(range = "cst"), value = c(range = 0.7),
                var = c(2, 2, 8))
myCov2

myCov3 <- covTS(d = 3, kernel = "k1PowExp",
                dep = c(range = "cst", shape = "cst"),
                value = c(shape = 1.8, range = 1.1),
                var = c(2, 2, 8))
myCov3



