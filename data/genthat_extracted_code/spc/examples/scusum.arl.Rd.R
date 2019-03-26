library(spc)


### Name: scusum.arl
### Title: Compute ARLs of CUSUM control charts (variance charts)
### Aliases: scusum.arl
### Keywords: ts

### ** Examples

## Knoth (2006)
## compare with Table 1 (p. 507)
k <- 1.46 # sigma1 = 1.5
df <- 1
h <- 10

# original values
# sigma coll63       BE     Hawkins  MC 10^9 (s.e.)
# 1     260.7369  260.7546  261.32  260.7399 (0.0081)
# 1.1    90.1319   90.1389   90.31   90.1319 (0.0027)
# 1.2    43.6867   43.6897   43.75   43.6845 (0.0013)
# 1.3    26.2916   26.2932   26.32   26.2929 (0.0007)
# 1.4    18.1231   18.1239   18.14   18.1235 (0.0005)
# 1.5    13.6268   13.6273   13.64   13.6272 (0.0003)
# 2       5.9904    5.9910    5.99    5.9903 (0.0001)
# replicate the column coll63
sigma <- c(1, 1.1, 1.2, 1.3, 1.4, 1.5, 2)
arl <- rep(NA, length(sigma))
for ( i in 1:length(sigma) )
  arl[i] <- round(scusum.arl(k, h, sigma[i], df, r=63, qm=20, version=2), digits=4)
data.frame(sigma, arl)



