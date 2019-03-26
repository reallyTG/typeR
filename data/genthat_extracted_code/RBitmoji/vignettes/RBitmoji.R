## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE----------------------------------------------------------
#  if (!requireNamespace("devtools")) {
#    install.packages("devtools")
#  }
#  devtools::install_github("bgreenwell/RBitmoji")

## ----get_id-01, eval=FALSE-----------------------------------------------
#  library(RBitmoji)
#  my_id <- get_id("greenwell.brandon@gmail.com")

## ----get_my_id-02, echo=FALSE--------------------------------------------
library(RBitmoji)
my_id <- "1551b314-5e8a-4477-aca2-088c05963111-v1"

## ----plot_comic----------------------------------------------------------
# Plot a single comic
plot_comic(my_id, tag = "time magazine")

# Plot a comic with a friend
plot_comic(c(my_id, my_id), tag = "sloth")

