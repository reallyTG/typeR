library(knitr)


### Name: Sweave2knitr
### Title: Convert Sweave to knitr documents
### Aliases: Sweave2knitr

### ** Examples

Sweave2knitr(text = "<<echo=TRUE>>=")  # this is valid
Sweave2knitr(text = "<<png=true>>=")  # dev='png'
Sweave2knitr(text = "<<eps=TRUE, pdf=FALSE, results=tex, width=5, prefix.string=foo>>=")
Sweave2knitr(text = "<<,png=false,fig=TRUE>>=")
Sweave2knitr(text = "\\SweaveOpts{echo=false}")
Sweave2knitr(text = "\\SweaveInput{hello.Rnw}")
# Sweave example in utils
testfile = system.file("Sweave", "Sweave-test-1.Rnw", package = "utils")
Sweave2knitr(testfile, output = "Sweave-test-knitr.Rnw")
knit("Sweave-test-knitr.Rnw")  # or knit2pdf() directly



