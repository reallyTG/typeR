## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- message=FALSE------------------------------------------------------
library(jstor)
library(dplyr)

input <- tibble::tribble(
  ~first_page,   ~last_page,    ~page_range,
  NA_real_,      NA_real_,      NA_character_, 
  1,             10,            "1 - 10",
  1,             10,            NA_character_,
  1,             NA_real_,      NA_character_, 
  1,             NA_real_,      "1-10",
  NA_real_,       NA_real_,      "1, 5-10",
  NA_real_,       NA_real_,      "1-4, 5-10",
  NA_real_,       NA_real_,      "1-4, C5-C10"
)

input %>% 
  mutate(n_pages = jst_get_total_pages(first_page, last_page, page_range))

## ------------------------------------------------------------------------
input %>% 
  jst_add_total_pages()

## ---- results='asis'-----------------------------------------------------
sample_article <- jst_get_article(jst_example("article_with_references.xml")) 

knitr::kable(sample_article)

## ------------------------------------------------------------------------
sample_article %>% 
  jst_unify_journal_id() %>% 
  left_join(jst_get_journal_overview()) %>% 
  tidyr::gather(variable, value) %>% 
  knitr::kable()

## ------------------------------------------------------------------------
sample_article %>% 
  pull(language)

