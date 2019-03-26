## ---- eval=FALSE---------------------------------------------------------
#     install.packages('seplyr')

## ---- eval=FALSE---------------------------------------------------------
#     devtools::install_github('WinVector/seplyr')

## ----ex1a----------------------------------------------------------------
suppressPackageStartupMessages(library("dplyr"))
packageVersion("dplyr")

datasets::mtcars %>% 
  arrange(cyl, desc(gear)) %>% 
  head()

## ----ex1b----------------------------------------------------------------
# Assume this is set elsewhere,
# supplied by a user, function argument, or control file.
orderTerms <- c('cyl', 'desc(gear)')

# Now convert into splice-able types, the idea is the user
# supplies variable names that we later convert to "quosures"
# for use in `dplyr` 0.7.* generic code.
# This code is near the pipe under the rule:
# "If you are close enough to form a quosure, 
#  you are close enough to re-code the analysis"
orderQs <- lapply(orderTerms,
                  function(si) { rlang::parse_expr(si) })
# pipe
datasets::mtcars %>% 
  arrange(!!!orderQs) %>% 
  head()

## ----ex1c----------------------------------------------------------------
library("seplyr")

datasets::mtcars %.>% 
  arrange_se(., orderTerms) %>% 
  head(.)

## ----atexse--------------------------------------------------------------
datasets::iris %.>%
  group_by_se(., "Species") %.>%
  summarize_se(., c("Mean.Sepal.Length" := "mean(Sepal.Length)", 
                    "Mean.Sepal.Width" := "mean(Sepal.Width)"))

