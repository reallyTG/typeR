library(HHG)


### Name: print.HHG.Test.Result
### Title: Print function for result of HHG tests
### Aliases: print.HHG.Test.Result

### ** Examples

#output for independence test
n = 50
X = hhg.example.datagen(n, '4indclouds') 

Dx = as.matrix(dist((X[1,]), diag = TRUE, upper = TRUE))
Dy = as.matrix(dist((X[2,]), diag = TRUE, upper = TRUE))

hhg = hhg.test(Dx, Dy, nr.perm = 1000)

#output for k-sample test
n = 50
D = hhg.example.datagen(n, 'FourClassUniv')
Dx = as.matrix(dist(D$x, diag = TRUE, upper = TRUE))

hhg = hhg.test.k.sample(Dx, D$y, nr.perm = 1000)



