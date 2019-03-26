library(snfa)


### Name: H.inv.select
### Title: Bandwidth matrix selection
### Aliases: H.inv.select

### ** Examples

data(USMacro)

USMacro <- USMacro[complete.cases(USMacro),]

#Extract data
X <- as.matrix(USMacro[,c("K", "L")])

#Generate bandwidth matrix
print(H.inv.select(X))
#              [,1]         [,2]
# [1,] 3.642704e-08 0.000000e+00
# [2,] 0.000000e+00 1.215789e-08




