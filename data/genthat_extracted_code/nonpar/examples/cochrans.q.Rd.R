library(nonpar)


### Name: cochrans.q
### Title: Cochran's Q Test
### Aliases: cochrans.q

### ** Examples

  ## Run Cochran's Q Test on a matrix.
  cochrans.q(matrix(c(1,1,1,1,1,1,
              1,1,0,1,1,1,
              0,0,0,1,0,0,
              0,1,0,0,1,1), 6, 4))

  ## Cochran's Q Test works for any size matrix.
  cochrans.q(matrix(c(0,1,0,0,1,0,0,0,1,0,0,0,0,0,
                0,1,1,1,1,1,1,1,0,1,1,1,1,1,
                0,1,0,0,0,0,0,0,1,0,0,0,0,0,
                0,1,1,0,0,1,1,0,0,0,0,1,0,1), 14, 4), alpha=0.01)




