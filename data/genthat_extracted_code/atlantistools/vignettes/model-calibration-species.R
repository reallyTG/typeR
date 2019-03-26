## ------------------------------------------------------------------------
library("atlantistools")
library("gridExtra")

# You should be able to build the vignette either by clicking on "Knit PDF" in RStudio or with
# rmarkdown::render("model-calibration-species.Rmd")

## ------------------------------------------------------------------------
result <- preprocess
species <- c("Shallow piscivorous fish", "Small planktivorous fish")

## ---- echo=FALSE, results = 'asis'---------------------------------------
plots <- lapply(species, plot_species, data_pre = result)
for (i in seq_along(plots)) {
  cat(paste0("## ", species[i]), sep = "\n")
  gridExtra::grid.arrange(plots[[i]])
  cat("\n\n")
}

