library(rstiefel)


### Name: NullC
### Title: Null Space of a Matrix
### Aliases: NullC

### ** Examples


NullC(matrix(0,4,2))

## The function is currently defined as
function (M) 
{
    tmp <- qr(M)
    set <- if (tmp$rank == 0L) 
        1L:nrow(M)
    else -(1L:tmp$rank)
    qr.Q(tmp, complete = TRUE)[, set, drop = FALSE]
  }




