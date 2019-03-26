library(cwhmisc)


### Name: num.ident
### Title: Check numerical values for identity
### Aliases: num.ident
### Keywords: logic arith

### ** Examples

  xxxx <- c(100,-1e-13,Inf,-Inf, NaN, pi, NA)
  names(xxxx) <- formatC(xxxx, dig=3)
  (aaaa <- outer(xxxx,xxxx,function(x,y) num.ident(x,y)))
  all((aaaa & !is.na(aaaa)) == (row(aaaa) == col(aaaa)))
  # aaaa has TRUE only on the diagonal, i.e. identity works correctly



