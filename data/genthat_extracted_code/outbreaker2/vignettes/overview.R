## ----install, eval=FALSE-------------------------------------------------
#  install.packages("outbreaker2")

## ----install2, eval=FALSE------------------------------------------------
#  devtools::install_github("reconhub/outbreaker2")

## ---- list_functions-----------------------------------------------------
env <- asNamespace("outbreaker2")
ls(envir = env, pattern = "^cpp")  

