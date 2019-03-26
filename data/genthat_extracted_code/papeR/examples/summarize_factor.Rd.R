library(papeR)


### Name: summarize_factor
### Title: Produce Summary Tables for Data Sets
### Aliases: summarize_factor
### Keywords: univar IO print

### ** Examples

## Example requires package nlme to be installed and loaded
if (require("nlme")) {
    ## Use dataset Orthodont
    data(Orthodont, package = "nlme")

    ## Get summary for continuous variables
    summarize(Orthodont, type = "factor")

    ## Reorder data for table:
    summarize(Orthodont, variables = c("Sex", "Subject"), type = "factor")

    ## What happens in the display if we introduce some missing values:
    set.seed(1907)
    Orthodont$Sex[sample(nrow(Orthodont), 20)] <- NA
    summarize(Orthodont, type = "factor")
    summarize(Orthodont, variables = "Sex", type = "factor")
    ## do not show statistics on missing values
    summarize(Orthodont, variables = "Sex", show.NAs = FALSE, type = "factor")
}



