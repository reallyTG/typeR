## ---- eval=FALSE---------------------------------------------------------
#  install.packages("learnrbook")

## ---- eval=FALSE---------------------------------------------------------
#  install.packages(learnrbook::pkgs_all)

## ---- eval=FALSE---------------------------------------------------------
#  install.packages(learnrbook::pkgs_ch_ggplot)

## ---- eval=FALSE---------------------------------------------------------
#  # install.packages("devtools")
#  for (pkg in learnrbook::pkgs_at_github) {
#    devtools::install_github(pkg)
#  }

## ---- eval=FALSE---------------------------------------------------------
#  system.file("extdata", package = "learnrbook")

## ------------------------------------------------------------------------
path2examples <- system.file("extdata", package = "learnrbook")
list.files(path2examples)

