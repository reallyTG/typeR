## ----echo = FALSE--------------------------------------------------------
NOT_CRAN <- identical(tolower(Sys.getenv("NOT_CRAN")), "true")
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  purl = NOT_CRAN,
  eval = NOT_CRAN
)
## this is nice during development = on github
## this is not so nice for preparing vignettes for CRAN
#options(knitr.table.format = 'markdown')

## ----load-package--------------------------------------------------------
library(aurelius)

## ----build-test-model----------------------------------------------------

# build a model
lm_model <- lm(mpg ~ hp, data = mtcars)

# convert the lm object to a list-of-lists PFA representation
lm_model_as_pfa <- pfa(lm_model)


## ----write-model, eval=FALSE---------------------------------------------
#  
#  # save as plain-text JSON
#  write_pfa(lm_model_as_pfa, file = "my-model.pfa")
#  

## ----read-model, eval=FALSE----------------------------------------------
#  
#  my_model <- read_pfa("my-model.pfa")
#  

