library(tolerance)


### Name: bintol.int
### Title: Binomial Tolerance Intervals
### Aliases: bintol.int
### Keywords: file

### ** Examples
 
## 85%/90% 2-sided binomial tolerance intervals for a future 
## lot of 2500 when a sample of 230 were drawn from a lot of 
## 1000.  All methods but Jeffreys' method are compared
## below.

bintol.int(x = 230, n = 1000, m = 2500, alpha = 0.15, P = 0.90,
           side = 2, method = "LS")
bintol.int(x = 230, n = 1000, m = 2500, alpha = 0.15, P = 0.90,
           side = 2, method = "WS")
bintol.int(x = 230, n = 1000, m = 2500, alpha = 0.15, P = 0.90,
           side = 2, method = "AC")
bintol.int(x = 230, n = 1000, m = 2500, alpha = 0.15, P = 0.90,
           side = 2, method = "CP")
bintol.int(x = 230, n = 1000, m = 2500, alpha = 0.15, P = 0.90,
           side = 2, method = "AS")
bintol.int(x = 230, n = 1000, m = 2500, alpha = 0.15, P = 0.90,
           side = 2, method = "LO")
bintol.int(x = 230, n = 1000, m = 2500, alpha = 0.15, P = 0.90,
           side = 2, method = "PR")
bintol.int(x = 230, n = 1000, m = 2500, alpha = 0.15, P = 0.90,
           side = 2, method = "PO")
bintol.int(x = 230, n = 1000, m = 2500, alpha = 0.15, P = 0.90,
           side = 2, method = "CL")
bintol.int(x = 230, n = 1000, m = 2500, alpha = 0.15, P = 0.90,
           side = 2, method = "CC")
bintol.int(x = 230, n = 1000, m = 2500, alpha = 0.15, P = 0.90,
           side = 2, method = "CWS")
           
## Using Jeffreys' method to construct the 85%/90% 1-sided 
## binomial tolerance limits.  The first calculation assumes 
## a prior on the proportion of defects which places greater
## density on values near 0.  The second calculation assumes
## a prior on the proportion of defects which places greater
## density on values near 1.

bintol.int(x = 230, n = 1000, m = 2500, alpha = 0.15, P = 0.90,
           side = 1, method = "JF", a1 = 2, a2 = 10)
bintol.int(x = 230, n = 1000, m = 2500, alpha = 0.15, P = 0.90,
           side = 1, method = "JF", a1 = 5, a2 = 1)


 


