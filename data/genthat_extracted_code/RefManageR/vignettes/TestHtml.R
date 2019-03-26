## ----unload, include = FALSE---------------------------------------------
## Needed to clear internal package citation list from previous vignette builds
unloadNamespace("RefManageR")

## ----setup, include = TRUE, cache = FALSE--------------------------------
library(RefManageR)
bib <- ReadBib(system.file("Bib", "biblatexExamples.bib",
                           package = "RefManageR"), check = FALSE)
bib2 <- ReadBib(system.file("Bib", "RJC.bib", package = "RefManageR"))[[seq_len(20)]]
BibOptions(check.entries = FALSE, style = "html")

## ----results = "asis", echo = FALSE--------------------------------------
PrintBibliography(bib, .opts = list(check.entries = FALSE, bib.style = "draft"))

## ----results = "asis", echo = FALSE--------------------------------------
PrintBibliography(bib2)

