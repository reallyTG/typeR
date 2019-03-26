library(Ridit)


### Name: print.ridit
### Title: Print Output of Ridit analysis
### Aliases: print.ridit
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x, ...) 
{
    cat("\n")
    cat("Ridit Analysis:")
    cat("\n")
    cat("\n")
    m = max(nchar(names(x$MeanRidit)))
    cutpoint = 40
    if (m > cutpoint) 
        m = cutpoint
    cat("Group", "\t", format("Label", width = m), "\t", "Mean Ridit", 
        "\n", sep = "")
    cat("-----", "\t", format("-----", width = m), "\t", "----------", 
        "\n", sep = "")
    for (k in 1:length(x$MeanRidit)) cat(k, "\t", format(substr(names(x$MeanRidit)[k], 
        start = 1, stop = m), width = m), "\t", round(x$MeanRidit, 
        4)[k], "\n", sep = "")
    cat("\n")
    cat(x$msg, "\n")
    cat("chi-squared = ", round(x$TestStatistic, 4), sep = "")
    cat(", df = ", x$df, sep = "")
    cat(", p-value = ", format(x$Sig, digits = 4), sep = "")
    cat("\n")
    cat("\n")
  }



