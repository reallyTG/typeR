library(knitr)


### Name: knit_filter
### Title: Spell check filter for source documents
### Aliases: knit_filter

### ** Examples

library(knitr)
knitr_example = function(...) system.file("examples", ..., package = "knitr")
## No test: 
if (Sys.which("aspell") != "") {
    # -t means the TeX mode
    utils::aspell(knitr_example("knitr-minimal.Rnw"), knit_filter, control = "-t")
    
    # -H is the HTML mode
    utils::aspell(knitr_example("knitr-minimal.Rmd"), knit_filter, control = "-H -t")
}
## End(No test)



