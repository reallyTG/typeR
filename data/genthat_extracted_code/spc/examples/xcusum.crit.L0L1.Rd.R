library(spc)


### Name: xcusum.crit.L0L1
### Title: Compute the CUSUM k and h for given in-control ARL L0 and
###   out-of-control L1
### Aliases: xcusum.crit.L0L1
### Keywords: ts

### ** Examples

## Table 2 from Ewan/Kemp (1960) -- one-sided CUSUM
#
# A.R.L. at A.Q.L.   A.R.L. at A.Q.L.     k      h
#       1000                3           1.12   2.40
#       1000                7           0.65   4.06
#        500                3           1.04   2.26
#        500                7           0.60   3.80
#        250                3           0.94   2.11
#        250                7           0.54   3.51
#
L0.set <- c(1000, 500, 250)
L1.set <- c(3, 7)
cat("\nL0\tL1\tk\th\n")
for ( L0 in L0.set ) {
  for ( L1 in L1.set ) {
    result <- round(xcusum.crit.L0L1(L0, L1), digits=2)
    cat(paste(L0, L1, result[1], result[2], sep="\t"), "\n")
  }
}
#
# two confirmation runs
xcusum.arl(0.54, 3.51, 0) # Ewan/Kemp
xcusum.arl(result[1], result[2], 0) # here
xcusum.arl(0.54, 3.51, 2*0.54) # Ewan/Kemp
xcusum.arl(result[1], result[2], 2*result[1]) # here
#
## Table II from Kemp (1962) -- two-sided CUSUM
#
#    Lr                  k
#             La=250   La=500   La=1000
#    2.5       1.05     1.17     1.27
#    3.0       0.94     1.035    1.13
#    4.0       0.78     0.85     0.92
#    5.0       0.68     0.74     0.80
#    6.0       0.60     0.655    0.71
#    7.5       0.52     0.57     0.62
#   10.0       0.43     0.48     0.52
#
L0.set <- c(250, 500, 1000)
L1.set <- c(2.5, 3:6, 7.5, 10)
cat("\nL1\tL0=250\tL0=500\tL0=1000\n")
for ( L1 in L1.set ) {
  cat(L1)
  for ( L0 in L0.set ) {
    result <- round(xcusum.crit.L0L1(L0, L1, sided="two"), digits=2)
    cat("\t", result[1])
  }
  cat("\n")
}



