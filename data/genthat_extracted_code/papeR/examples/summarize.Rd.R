library(papeR)


### Name: summarize
### Title: Produce Summary Tables for Data Sets
### Aliases: summarize summarise
### Keywords: univar IO print

### ** Examples

if (require("nlme")) {
    ## Use dataset Orthodont
    data(Orthodont, package = "nlme")

    ## Get summary for continuous variables
    (tab1 <- summarize(Orthodont, type = "numeric"))

    ## Change statistics to display
    summarize(Orthodont, quantiles = FALSE, type = "numeric")
    summarize(Orthodont, quantiles = FALSE, count = FALSE, type = "numeric")
    summarize(Orthodont, mean_sd = FALSE, type = "numeric")

    ## Get summary for categorical variables
    (tab2 <- summarize(Orthodont, type = "fac"))

    ## use fraction instead of percentage
    summarize(Orthodont, percent = FALSE, type = "fac")

    ## Using the tables with Markdown
    if (require("knitr")) {
        kable(tab1)
        kable(tab2)
    }

    ## Using the tables with LaTeX
    if (require("xtable")) {
        xtable(tab1)
        ## grouped table
        xtable(summarize(Orthodont, group = "Sex"))
        xtable(tab2)
    }
}



