## ---- echo=FALSE---------------------------------------------------------
library(ffmetadata)

## ------------------------------------------------------------------------
select_type <- select_metadata(variable_name = "ce3datey", fields = "data_source")

## ---- echo=FALSE---------------------------------------------------------
select_type

## ------------------------------------------------------------------------
select_multiple_fields <- select_metadata(variable_name = "ce3datey", fields = c("data_source", "data_type"))

## ---- echo=FALSE---------------------------------------------------------
select_multiple_fields

## ------------------------------------------------------------------------
select_full <- select_metadata(variable_name = "ce3datey")

## ---- echo=FALSE---------------------------------------------------------
select_full

## ------------------------------------------------------------------------
select_return_list <- select_metadata(variable_name = "ce3datey", returnDataFrame = FALSE)

## ---- echo=FALSE---------------------------------------------------------
select_return_list

## ------------------------------------------------------------------------
search_1 <- search_metadata(wave = "Year 1")

## ------------------------------------------------------------------------
search_1_and <- search_metadata(wave = "Year 1", respondent = "Mother")

## ------------------------------------------------------------------------
search_start_with <- search_metadata(name = "f1%", operation = "like")

## ------------------------------------------------------------------------
search_respondents <- search_metadata(respondent = list("Interviewer", "Child Care Provider"), operation = "in")

## ------------------------------------------------------------------------
search_qtext <- search_metadata(qtext = "is_null")

