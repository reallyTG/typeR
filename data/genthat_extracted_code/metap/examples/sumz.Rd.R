library(metap)


### Name: sumz
### Title: Combine p-values using the sum of z (Stouffer's) method
### Aliases: sumz 'Stouffer's method' 'Sum of normals method' print.sumz
### Keywords: htest

### ** Examples

data(teachexpect)
sumz(teachexpect) # z = 2.435, p = 0.0074, from Becker
data(beckerp)
sumz(beckerp) # z = 1.53, NS, from Beckerp
data(rosenthal)
sumz(rosenthal$p) # 2.39, p = 0.009
sumz(p, df, rosenthal) # 3.01, p = 0.0013
data(validity)
sumz(validity) # z = 8.191, p = 1.25 * 10^{-16}



