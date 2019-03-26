## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(jstor)
library(purrr)
library(stringr)

## ------------------------------------------------------------------------
jst_preview_zip(jst_example("pseudo_dfr.zip")) %>% knitr::kable()

## ------------------------------------------------------------------------
import_spec <- jst_define_import(
  article = c(jst_get_article, jst_get_authors),
  book = jst_get_book,
  ngram1 = jst_get_ngram
)

## ------------------------------------------------------------------------
# set up a temporary folder for output files
tmp <- tempdir()

# extract the content and write output to disk
jst_import_zip(jst_example("pseudo_dfr.zip"),
               import_spec = import_spec,
               out_file = "my_test",
               out_path = tmp)


## ------------------------------------------------------------------------
list.files(tmp, pattern = "csv")

## ------------------------------------------------------------------------
jst_re_import(
  file.path(tmp, "my_test_journal_article_jst_get_article-1.csv")
) %>% 
  knitr::kable()

## ---- eval=FALSE---------------------------------------------------------
#  library(future)
#  
#  plan(multiprocess)

## ---- eval=FALSE---------------------------------------------------------
#  vignette("future-1-overview", package = "future")

## ---- echo=TRUE----------------------------------------------------------
example_dir <- system.file("extdata", package = "jstor")

## ------------------------------------------------------------------------
file_names_listed <- list.files(path = example_dir, full.names = T, pattern = "*.xml")
file_names_listed

## ---- eval=FALSE---------------------------------------------------------
#  file_names <- system(paste0("cd ", example_dir, "; find . -name '*.xml' -type f"), intern = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  library(stringr)
#  
#  file_names_system <- file_names %>%
#    str_replace("^\\.\\/", "") %>%
#    str_c(example_dir, "/", .)
#  
#  file_names_system
#  #> [1] "/Library/Frameworks/R.framework/Versions/3.4/Resources/library/jstor/extdata/sample_with_footnotes.xml"
#  #> [2] "/Library/Frameworks/R.framework/Versions/3.4/Resources/library/jstor/extdata/sample_book.xml"
#  #> [3] "/Library/Frameworks/R.framework/Versions/3.4/Resources/library/jstor/extdata/sample_with_references.xml"

## ------------------------------------------------------------------------
# only work with journal articles
article_paths <- file_names_listed %>% 
  keep(str_detect, "with")

article_paths %>% 
  map_df(jst_get_article) %>% 
  knitr::kable()


## ------------------------------------------------------------------------
jst_import(article_paths, out_file = "my_second_test", .f = jst_get_article, 
           out_path = tmp)

## ------------------------------------------------------------------------
list.files(tmp, pattern = "csv")

