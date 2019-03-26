library(papeR)


### Name: summarize_numeric
### Title: Produce Summary Tables for Data Sets
### Aliases: summarize_numeric
### Keywords: univar IO print

### ** Examples

if (require("nlme")) {
    ## Use dataset Orthodont
    data(Orthodont, package = "nlme")

    ## Get summary for continuous variables
    summarize(Orthodont, type = "numeric")

    ## Change statistics to display
    summarize(Orthodont, quantiles = FALSE, type = "numeric")
    summarize(Orthodont, quantiles = FALSE, count = FALSE, type = "numeric")
    summarize(Orthodont, mean_sd = FALSE, type = "numeric")

    ## for more examples see ?summarize
}



