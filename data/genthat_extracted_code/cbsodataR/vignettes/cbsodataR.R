## ---- include=FALSE------------------------------------------------------
library(dplyr)

## ----cbs_get_toc, message=FALSE------------------------------------------
library(dplyr) # not needed, but used in examples below
library(cbsodataR)

toc <- cbs_get_toc(Language="en") # retrieve only english tables

toc %>% 
  select(Identifier, ShortTitle) 

## ----get_meta, message=FALSE---------------------------------------------
apples <- cbs_get_meta('71509ENG')
apples

## ---- meta2--------------------------------------------------------------
names(apples)

## ---- cbs_get_data2, message=FALSE---------------------------------------
cbs_get_data('71509ENG') %>% 
  select(1:4) %>%  # demonstration purpose
  head()

## ---- get_data, message=FALSE--------------------------------------------
cbs_get_data('71509ENG') %>%
  cbs_add_label_columns() %>% 
  select(1:4) %>% 
  head()

## ------------------------------------------------------------------------
cbs_get_data('71509ENG') %>%
  cbs_add_date_column() %>% 
  select(2:4) %>% 
  head()

## ------------------------------------------------------------------------
cbs_get_data('71509ENG') %>%
  cbs_add_date_column(date_type = "numeric") %>% 
  select(2:4) %>% 
  head()

## ---- get_data3, message=FALSE-------------------------------------------
  cbs_get_data('71509ENG', Periods='2000JJ00') %>% 
  select(1:4) %>% 
  head()

