library(papeR)


### Name: latex.table.fac
### Title: Produce (LaTeX) Summaries for Factor Variables
### Aliases: latex.table.fac print.table.fac
### Keywords: univar IO print

### ** Examples

## Example requires package nlme to be installed and loaded
if (require("nlme")) {
    ## Use dataset Orthodont
    data(Orthodont, package = "nlme")

    ## Get summary for continuous variables
    latex.table.fac(Orthodont)

    ## Reorder data for table:
    latex.table.fac(Orthodont, variables = c("Sex", "Subject"))

    ## What happens in the display if we introduce some missing values:
    set.seed(1907)
    Orthodont$Sex[sample(nrow(Orthodont), 20)] <- NA
    latex.table.fac(Orthodont)
    latex.table.fac(Orthodont, variables = "Sex")
    ## do not show statistics on missing values
    latex.table.fac(Orthodont, variables = "Sex", show.NAs = FALSE)
}



