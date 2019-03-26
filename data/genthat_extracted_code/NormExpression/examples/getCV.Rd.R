library(NormExpression)


### Name: getCV
### Title: getCV
### Aliases: getCV
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (data, cvNorm = TRUE)
{
    if (!is.matrix(data))
        data <- as.matrix(data)
    if (cvNorm) {
        rawCV <- apply(data, 1, function(x) {
            sd(log2(x[x != 0]))/mean(log2(x[x != 0]))
        })
        (rawCV - min(rawCV))/(max(rawCV) - min(rawCV))
    }
    else {
        apply(data, 1, function(x) {
            sd(x)/mean(x)
        })
    }
  }



