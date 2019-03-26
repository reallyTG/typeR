library(sensR)


### Name: ROC
### Title: Plot the Receiver Operating Characteristic Curve
### Aliases: ROC.default ROC.anota ROC
### Keywords: hplot

### ** Examples

## ROC.default:
(mat <- matrix(c(8, 17, 1, 24), 2, byrow = TRUE))
(d.prime <- SDT(mat, "probit")[3])
ROC(d.prime)
## ROC.anota:
fm1 <- AnotA(8, 25, 1, 25)
ROC(fm1)



