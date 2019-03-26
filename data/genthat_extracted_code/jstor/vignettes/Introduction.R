## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- message=FALSE, warning=FALSE---------------------------------------
library(jstor)
library(dplyr)
library(knitr)

## ------------------------------------------------------------------------
meta_data <- jst_get_article(file_path = jst_example("article_with_references.xml"))

## ---- results='asis'-----------------------------------------------------
meta_data %>% kable()

## ---- results='asis'-----------------------------------------------------
authors <- jst_get_authors(jst_example("article_with_references.xml"))
kable(authors)

## ------------------------------------------------------------------------
references <- jst_get_references(jst_example("article_with_references.xml"))

# # we need to remove line breaks for knitr::kable() to work properly for printing
references <- references %>%
  mutate(ref_unparsed = stringr::str_remove_all(ref_unparsed, "\\\n"))

## ---- echo=FALSE---------------------------------------------------------
set.seed(1234)

## ------------------------------------------------------------------------
references %>% 
  sample_n(5) %>% 
  kable()

## ------------------------------------------------------------------------
jst_get_references(
  jst_example("parsed_references.xml"),
  parse_refs = T
) %>% 
  kable()

## ---- results='asis'-----------------------------------------------------
jst_get_footnotes(jst_example("article_with_references.xml")) %>% 
  kable()

## ---- results='asis'-----------------------------------------------------
footnotes <- jst_get_footnotes(jst_example("article_with_footnotes.xml"))

footnotes %>% 
  mutate(footnotes = stringr::str_remove_all(footnotes, "\\\n")) %>% 
  kable()


## ---- results='asis'-----------------------------------------------------
full_text <- jst_get_full_text(jst_example("full_text.txt"))
full_text %>% 
  mutate(full_text = stringr::str_remove_all(full_text, "\\\n")) %>% 
  kable()

## ---- results='asis'-----------------------------------------------------
meta_data %>% 
  left_join(authors) %>%
  select(file_name, article_title, pub_year, given_name, surname) %>% 
  kable()

## ---- results='asis'-----------------------------------------------------
meta_data %>% 
  left_join(references) %>% 
  select(file_name, article_title, volume, pub_year, ref_unparsed) %>%
  head(5) %>% 
  kable()

## ---- results='asis'-----------------------------------------------------
jst_get_book(jst_example("book.xml")) %>% knitr::kable()

## ------------------------------------------------------------------------
chapters <- jst_get_chapters(jst_example("book.xml"))

str(chapters)

## ---- results='asis'-----------------------------------------------------
chapters %>% 
  select(-abstract) %>% 
  head(10) %>% 
  kable()

## ------------------------------------------------------------------------
author_chap <- jst_get_chapters(jst_example("book.xml"), authors = TRUE) 

## ------------------------------------------------------------------------
class(author_chap$authors)

## ------------------------------------------------------------------------
author_chap %>% 
  tidyr::unnest() %>% 
  select(part_id, given_name, surname) %>% 
  head(10) %>% 
  kable()

