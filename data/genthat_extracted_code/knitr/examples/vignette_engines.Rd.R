library(knitr)


### Name: vignette_engines
### Title: Package vignette engines
### Aliases: vignette_engines

### ** Examples

library(knitr)
vig_list = tools::vignetteEngine(package = "knitr")
str(vig_list)
vig_list[["knitr::knitr"]][c("weave", "tangle")]
vig_list[["knitr::knitr_notangle"]][c("weave", "tangle")]
vig_list[["knitr::docco_classic"]][c("weave", "tangle")]



