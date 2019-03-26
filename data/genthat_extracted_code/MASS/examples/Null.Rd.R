library(MASS)


### Name: Null
### Title: Null Spaces of Matrices
### Aliases: Null
### Keywords: algebra

### ** Examples

# The function is currently defined as
function(M)
{
    tmp <- qr(M)
    set <- if(tmp$rank == 0L) seq_len(ncol(M)) else  -seq_len(tmp$rank)
    qr.Q(tmp, complete = TRUE)[, set, drop = FALSE]
}



