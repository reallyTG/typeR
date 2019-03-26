library(vines)


### Name: vineGoF
### Title: Vine Goodness-of-fit Tests
### Aliases: vineGoF

### ** Examples

copula <- normalCopula(c(-0.25, -0.21, 0.34, 0.51, -0.07, -0.18), 
                       dispstr = "un", dim = 4)
data <- rCopula(100, copula)

selectCopula <- function (vine, j, i, x, y) {
    data <- cbind(x, y)
    fit <- fitCopula(normalCopula(), data, method = "itau")
    fit@copula
}
normalCVine <- vineFit("CVine", data, method = "ml",
                       selectCopula = selectCopula,
                       optimMethod = "")@vine
normalDVine <- vineFit("DVine", data, method = "ml",
                       selectCopula = selectCopula,
                       optimMethod = "")@vine
show(normalCVine)
show(normalDVine)

normalCVineGof <- vineGoF(normalCVine, data, method = "PIT",
                          statistic = "Breymann")
normalDVineGof <- vineGoF(normalDVine, data, method = "PIT",
                          statistic = "Breymann")
show(normalCVineGof)
show(normalDVineGof)



