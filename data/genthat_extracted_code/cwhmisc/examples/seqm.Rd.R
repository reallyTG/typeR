library(cwhmisc)


### Name: seqm
### Title: sequences, empty if "by" not conforming
### Aliases: seqm
### Keywords: arith

### ** Examples

  seqm(12,4,-1)  #  12 11 10  9  8  7  6  5  4
  seqm(12,4,2)   #  NULL
  lo <- 1; up <- 3
  for (ii in lo:up) {
    cat(ii,"    ")
    for (kk in seqm(lo,ii-1)) {
      cat("   ",kk)  # do-in-lower-triangle
    }
    cat(" diag")     # do-something-on-the-diagonal
    for (kk in seqm(ii+1,up)) {
      cat("  :",kk)  # do-in-upper-traingle
    }
    cat("\n")    
  }
# 1      diag  : 2  : 3
# 2         1 diag  : 3
# 3         1    2 diag



