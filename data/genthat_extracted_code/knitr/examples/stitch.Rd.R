library(knitr)


### Name: stitch
### Title: Automatically create a report based on an R script and a
###   template
### Aliases: stitch stitch_rhtml stitch_rmd

### ** Examples

s = system.file("misc", "stitch-test.R", package = "knitr")
if (interactive()) stitch(s)  # compile to PDF

# HTML report
stitch(s, system.file("misc", "knitr-template.Rhtml", package = "knitr"))

# or convert markdown to HTML
stitch(s, system.file("misc", "knitr-template.Rmd", package = "knitr"))



