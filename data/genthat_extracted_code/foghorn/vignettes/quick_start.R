## ----example-------------------------------------------------------------
## load the package
library(foghorn)

## ----graphical-interface-------------------------------------------------
## Graphical interface
summary_cran_results(email = "francois.michonneau@gmail.com")

## ----tibble--------------------------------------------------------------
## Results as a tibble
cran_results(email = "francois.michonneau@gmail.com")

## ----package-name--------------------------------------------------------
## either by themselves
summary_cran_results(pkg = c("ggplot2", "dplyr"))
cran_results(pkg = c("ggplot2", "dplyr"))

## or by combining them with email addresses
summary_cran_results(email = "francois.michonneau@gmail.com",
                     pkg = c("mregions", "ridigbio"))
cran_results(email = "francois.michonneau@gmail.com",
                   pkg = c("mregions", "ridigbio"))

## ----cran-details--------------------------------------------------------
tidyr_details <- cran_details(pkg = "tidyr")
tidyr_details
summary(tidyr_details)

## ----show-cran-db, eval=FALSE--------------------------------------------
#  cran_results(pkg = "nlme", src = "crandb")

