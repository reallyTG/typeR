## ---- eval=FALSE---------------------------------------------------------
#  # from cran
#  install.packages('PkgsFromFiles')
#  
#  # from github
#  if (!require(devtools)) install.packages('devtools')
#  devtools::install_github('msperlin/PkgsFromFiles')

## ---- eval=FALSE---------------------------------------------------------
#  # Evaluation is disable so it passes CRAN CHECKS, but you should be able to run it in your computer
#  library(PkgsFromFiles)
#  
#  # make sure
#  my.dir <- dirname(system.file('extdata', package = 'PkgsFromFiles'))
#  
#  df <- pff_find_and_install_pkgs(folder.in = my.dir)
#  

## ---- eval=FALSE---------------------------------------------------------
#  dplyr::glimpse(df)

## ---- eval=FALSE---------------------------------------------------------
#  p <- pff_plot_summary_pkgs(folder.in = my.dir)
#  print(p)

