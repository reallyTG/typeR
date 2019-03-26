library(papeR)


### Name: xtable.summary
### Title: Create And Print Tables With Markup
### Aliases: xtable xtable.summary print.xtable print.xtable.summary
### Keywords: univar IO print

### ** Examples

if (require("nlme")) {
    ## Use dataset Orthodont
    data(Orthodont, package = "nlme")

    ## Get summary for continuous variables
    (tab1 <- summarize(Orthodont, type = "numeric"))

    ## Get summary for categorical variables
    (tab2 <- summarize(Orthodont, type = "fac"))

    ## Using the tables with LaTeX
    if (require("xtable")) {
        xtable(tab1)
        ## grouped table
        xtable(summarize(Orthodont, group = "Sex"))
        xtable(tab2)
    }
}



