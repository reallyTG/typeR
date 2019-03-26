library(ALSM)


### Name: MLS
### Title: MLS
### Aliases: MLS

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (MSE1, df1, c1, MSE2, df2, c2, alpha = 0.05)
{
    f1 = qf(1 - alpha/2, df1, Inf)
    f2 = qf(1 - alpha/2, df2, Inf)
    f3 = qf(1 - alpha/2, Inf, df1)
    f4 = qf(1 - alpha/2, Inf, df2)
    f5 = qf(1 - alpha/2, df1, df2)
    f6 = qf(1 - alpha/2, df2, df1)
    g1 <- 1 - 1/f1
    g2 <- 1 - 1/f2
    g3 <- (((f5 - 1)^2) - ((g1 * f5)^2) - ((f4 - 1)^2))/f5
    g4 <- f6 * ((((f6 - 1)/f6)^2) - 1 * (((f3 - 1)/f6)^2) - g2^2)
    hl <- sqrt(((g1 * c1 * MSE1)^2) + (((f4 - 1) * c2 * MSE2)^2) -
        1 * ((g3 * c1 * c2 * MSE1 * MSE2)))
    hu <- sqrt((((f3 - 1) * c1 * MSE1)^2) + ((g2 * c2 * MSE2)^2) -
        1 * ((g4 * c1 * c2 * MSE1 * MSE2)))
    l = c1 * MSE1 + c2 * MSE2
    L = sum(l)
    lower <- L - hl
    upper <- L + hu
    return(cbind(estimate = L, lower = lower, upper = upper))
  }



