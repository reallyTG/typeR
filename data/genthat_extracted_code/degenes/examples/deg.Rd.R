library(degenes)


### Name: deg
### Title: Detection of differentially expressed genes.
### Aliases: deg

### ** Examples

X1 = matrix(rnorm(2000, 0, 1), 200, 10)
X2 = matrix(rnorm(2000, 0, 1), 200, 10)
index = sample(1:200, 5, replace=FALSE)
X2[index,] = X2[index,] + 5
D = deg(X1, X2)
PD = pdeg(X1, X2)
PDa = p.adjust(PD, method="bonferroni")
sort(index)
D
which(PDa<0.05)
which(PD<0.05)



