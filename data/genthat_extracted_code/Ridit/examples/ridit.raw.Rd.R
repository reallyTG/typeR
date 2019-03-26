library(Ridit)


### Name: ridit.raw
### Title: Engine function that compute Ridit analysis
### Aliases: ridit.raw
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x, g, ref = NULL) 
{
    x = as.numeric(x)
    x = as.vector(x)
    g = as.factor(g)
    levels = levels(g)
    levels(g) = 1:length(levels)
    g = as.vector(g)
    g = as.character(g)
    code = is.numeric(ref)
    ref = as.vector(ref)
    ref = as.character(ref)
    if (length(ref) > 1) {
        x = c(x, ref)
        g = c(g, rep(".ref", length(ref)))
        levels = c(".ref", levels)
    }
    crosstab = t(as.matrix(table(x, g)))
    rownames(crosstab) = levels
    refindex = NULL
    if (length(ref) == 1) {
        if (!code) 
            refindex = which(levels == ref)
        if (code && ref >= 1 && ref <= nrow(crosstab)) 
            refindex = as.numeric(ref)
    }
    else if (length(ref) > 1) 
        refindex = which(levels == ".ref")
    if (length(refindex) != 0) 
        refrow = crosstab[refindex, ]
    else refrow = apply(crosstab, 2, sum)
    if (length(refindex) == 0) 
        msg = paste("Reference: Total of all groups", sep = "")
    else msg = paste("Reference: Group = ", refindex, ", Label = ", 
        levels[refindex], sep = "")
    nref = sum(refrow)
    ridit = 0.5 * refrow[1]/nref
    for (i in 2:length(refrow)) {
        iridit = (sum(refrow[1:i - 1]) + 0.5 * refrow[i])/nref
        ridit = c(ridit, iridit)
    }
    n = apply(crosstab, 1, sum)
    meanRidit = c()
    for (i in 1:nrow(crosstab)) {
        itable = crosstab[i, ]
        meanRidit = c(meanRidit, sum(ridit * itable)/n[i])
    }
    n0 = sum(n)
    rbar0 = sum(n * meanRidit)/n0
    t = apply(crosstab, 2, sum)
    f = 1 - (sum(t * (t - 1) * (t + 1)))/(n0 * (n0 - 1) * (n0 + 
        1))
    teststatistic = (12 * n0 * sum(n * (meanRidit - rbar0)^2))/((n0 + 
        1) * f)
    testdf = nrow(crosstab) - 1
    pvalue = pchisq(q = teststatistic, df = testdf, lower.tail = FALSE)
    if (length(ref) == 0) 
        ref = NULL
    names(meanRidit) = rownames(crosstab)
    output = list(MeanRidit = meanRidit, TestStatistic = teststatistic, 
        df = testdf, Sig = pvalue, x = x, g = g, ref = ref, crosstab = crosstab, 
        msg = msg)
    class(output) <- c("ridit", class(output))
    output
  }



