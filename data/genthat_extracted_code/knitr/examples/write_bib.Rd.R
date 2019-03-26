library(knitr)


### Name: write_bib
### Title: Generate BibTeX bibliography databases for R packages
### Aliases: write_bib

### ** Examples

write_bib(c("RGtk2", "gWidgets"), file = "R-GUI-pkgs.bib")
write_bib(c("animation", "rgl", "knitr", "ggplot2"))
write_bib(c("base", "parallel", "MASS"))  # base and parallel are identical
write_bib("cluster", prefix = "")  # a empty prefix
write_bib("digest", prefix = "R-pkg-")  # a new prefix
write_bib("digest", tweak = FALSE)  # original version

# what tweak=TRUE does
str(knitr:::.tweak.bib)



