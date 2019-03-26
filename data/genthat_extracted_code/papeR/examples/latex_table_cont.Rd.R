library(papeR)


### Name: latex.table.cont
### Title: Produce (LaTeX) Summaries for Continuous Variables
### Aliases: latex.table.cont print.table.cont
### Keywords: univar IO print

### ** Examples

## Example requires package nlme to be installed and loaded
if (require("nlme")) {
    ## Use dataset Orthodont
    data(Orthodont, package = "nlme")

    ## Get summary for continuous variables
    latex.table.cont(Orthodont)

    ## Change statistics to display
    latex.table.cont(Orthodont, quantiles = FALSE)
    latex.table.cont(Orthodont, count = FALSE, quantiles = FALSE)
    latex.table.cont(Orthodont, mean_sd = FALSE)

    ## Show column 'Missing' even if no missings are present
    latex.table.cont(Orthodont, show.NAs = TRUE)

    ## Change variables to display
    latex.table.cont(Orthodont, variables = "age")

    ## What happens in the display if we introduce some missing values:
    set.seed(1907)
    Orthodont$age[sample(nrow(Orthodont), 20)] <- NA
    latex.table.cont(Orthodont)
}



