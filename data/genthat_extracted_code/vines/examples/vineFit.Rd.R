library(vines)


### Name: vineFit
### Title: Vine Inference
### Aliases: vineFit

### ** Examples

data <- matrix(runif(5 * 100), ncol = 5, nrow = 100)
colnames(data) <- c("A", "B", "C", "D", "E")

selectCopula <- function (vine, j, i, x, y) {
    data <- cbind(x, y)
    fit <- fitCopula(normalCopula(), data, method = "itau")
    fit@copula
}
fit <- vineFit("DVine", data, method = "ml", 
               selectCopula = selectCopula, 
               optimMethod = "")

show(fit)
show(fit@vine)



