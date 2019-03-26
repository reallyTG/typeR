library(broom.mixed)


### Name: tidy.TMB
### Title: Tidying methods for TMB models
### Aliases: tidy.TMB

### ** Examples

if (require("TMB")) {
    runExample("simple",thisR=TRUE)
    class(obj) <- "TMB"
    tidy(obj,conf.int=TRUE,conf.method="wald")
    tidy(obj,conf.int=TRUE,conf.method="uniroot")
}



