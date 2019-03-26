library(impimp)


### Name: impimp
### Title: Imprecise Imputation for Statistical Matching
### Aliases: impimp print.impimp is.impimp
### Keywords: datagen robust

### ** Examples

A <- data.frame(x1 = c(1,0), x2 = c(0,0),
                y1 = c(1,0), y2 = c(2,2))
B <- data.frame(x1 = c(1,1,0), x2 = c(0,0,0),
                z1 = c(0,1,1), z2 = c(0,1,2))
impimp(A, B, method = "variable_wise")

## Specifically setting the possible levels of 'z1'
impimp(A, B, method = "domain", vardomains = list(z1 = c(0:5)))




