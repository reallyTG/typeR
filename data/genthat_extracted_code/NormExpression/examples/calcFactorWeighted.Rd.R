library(NormExpression)


### Name: calcFactorWeighted
### Title: calcFactorWeighted
### Aliases: calcFactorWeighted
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (obs, ref, libsize.obs = NULL, libsize.ref = NULL, logratioTrim = 0.3,
    sumTrim = 0.05, doWeighting = TRUE, Acutoff = -1e+10)
{
    if (all(obs == ref))
        return(1)
    obs <- as.numeric(obs)
    ref <- as.numeric(ref)
    if (is.null(libsize.obs))
        nO <- sum(obs)
    else nO <- libsize.obs
    if (is.null(libsize.ref))
        nR <- sum(ref)
    else nR <- libsize.ref
    logR <- log2((obs/nO)/(ref/nR))
    absE <- (log2(obs/nO) + log2(ref/nR))/2
    v <- (nO - obs)/nO/obs + (nR - ref)/nR/ref
    fin <- is.finite(logR) & is.finite(absE) & (absE > Acutoff)
    logR <- logR[fin]
    absE <- absE[fin]
    v <- v[fin]
    n <- length(logR)
    loL <- floor(n * logratioTrim) + 1
    hiL <- n + 1 - loL
    loS <- floor(n * sumTrim) + 1
    hiS <- n + 1 - loS
    keep <- (rank(logR) >= loL & rank(logR) <= hiL) & (rank(absE) >=
        loS & rank(absE) <= hiS)
    if (doWeighting) {
        2^(sum(logR[keep]/v[keep], na.rm = TRUE)/sum(1/v[keep],
            na.rm = TRUE))
    }
    else {
        2^(mean(logR[keep], na.rm = TRUE))
    }
  }



