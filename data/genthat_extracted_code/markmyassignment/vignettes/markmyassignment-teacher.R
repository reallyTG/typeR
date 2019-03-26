## ---- message=FALSE, eval=FALSE------------------------------------------
#  install.packages("markmyassignment")

## ---- message=FALSE, eval=FALSE------------------------------------------
#  help(package = "markmyassignment")

## ---- message=FALSE, eval=FALSE------------------------------------------
#  vignette("markmyassignment")

## ---- message=FALSE, eval=FALSE------------------------------------------
#  set_assignment("https://github.com/MansMeg/markmyassignment/blob/master/inst/extdata/assignment_template.yml")

## ---- message=FALSE, eval=FALSE------------------------------------------
#  vignette("markmyassignment")

## ---- results='asis', echo=FALSE-----------------------------------------
suppressPackageStartupMessages(library(markmyassignment))
x <- ls("package:markmyassignment")[grepl(ls("package:markmyassignment"),pattern = "expect")]
cat(paste(paste0("- `", x, "`"), collapse = "\n"))

## ---- message=FALSE, eval=FALSE------------------------------------------
#  mark_my_assignment(reporter = "summary")

## ---- message=FALSE, eval=FALSE------------------------------------------
#  set_assignment("<github private repo url>", httr::authenticate("<Github_Personal_Access_Token>", ""))

