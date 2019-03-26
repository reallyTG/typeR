library(BNPdensity)


### Name: qgeneric
### Title: Generic function to find quantiles of a distribution
### Aliases: qgeneric
### Keywords: internal

### ** Examples

## The function is currently defined as
function (pdist, p, ...) 
{
    args <- list(...)
    if (is.null(args$log.p)) 
        args$log.p <- FALSE
    if (is.null(args$lower.tail)) 
        args$lower.tail <- TRUE
    if (is.null(args$lbound)) 
        args$lbound <- -Inf
    if (is.null(args$ubound)) 
        args$ubound <- Inf
    if (args$log.p) 
        p <- exp(p)
    if (!args$lower.tail) 
        p <- 1 - p
    ret <- numeric(length(p))
    ret[p == 0] <- args$lbound
    ret[p == 1] <- args$ubound
    args[c("lower.tail", "log.p", "lbound", "ubound")] <- NULL
    maxlen <- max(sapply(c(args, p = list(p)), length))
    for (i in seq(along = args)) args[[i]] <- rep(args[[i]], 
        length.out = maxlen)
    p <- rep(p, length.out = maxlen)
    ret[p < 0 | p > 1] <- NaN
    ind <- (p > 0 & p < 1)
    if (any(ind)) {
        hind <- seq(along = p)[ind]
        h <- function(y) {
            args <- lapply(args, function(x) x[hind[i]])
            p <- p[hind[i]]
            args$q <- y
            (do.call(pdist, args) - p)
        }
        ptmp <- numeric(length(p[ind]))
        for (i in 1:length(p[ind])) {
            interval <- c(-1, 1)
            while (h(interval[1]) * h(interval[2]) >= 0) {
                interval <- interval + c(-1, 1) * 0.5 * (interval[2] - 
                  interval[1])
            }
            ptmp[i] <- uniroot(h, interval, tol = .Machine$double.eps)$root
        }
        ret[ind] <- ptmp
    }
    if (any(is.nan(ret))) 
        warning("NaNs produced")
    ret
  }



