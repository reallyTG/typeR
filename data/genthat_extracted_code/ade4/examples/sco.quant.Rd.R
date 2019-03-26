library(ade4)


### Name: sco.quant
### Title: Graph to Analyse the Relation between a Score and Quantitative
###   Variables
### Aliases: sco.quant
### Keywords: hplot multivariate

### ** Examples

w <- runif(100, -5, 10)
fw <- cut (w, 5)
levels(fw) <- LETTERS[1:5]
wX <- data.frame(matrix(w + rnorm(900, sd = (1:900) / 100), 100, 9))
sco.quant(w, wX, fac = fw, abline = TRUE, clab = 2, csub = 3)



