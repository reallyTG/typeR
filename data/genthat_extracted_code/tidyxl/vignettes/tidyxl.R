## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "README-"
)

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  devtools::install_github("nacnudus/tidyxl")

## ---- echo = TRUE--------------------------------------------------------
ftable(Titanic, row.vars = 1:2)

## ---- echo = TRUE--------------------------------------------------------
titanic <- system.file("extdata/titanic.xlsx", package = "tidyxl")
readxl::read_excel(titanic)

## ---- echo = TRUE--------------------------------------------------------
library(tidyxl)
x <- xlsx_cells(titanic)
dplyr::glimpse(x)

## ---- echo = TRUE--------------------------------------------------------
x[x$data_type == "character", c("address", "character")]
x[x$row == 4, c("address", "character", "numeric")]

## ---- echo = TRUE--------------------------------------------------------
# Bold
formats <- xlsx_formats(titanic)
formats$local$font$bold
x[x$local_format_id %in% which(formats$local$font$bold),
  c("address", "character")]

# Yellow fill
formats$local$fill$patternFill$fgColor$rgb
x[x$local_format_id %in%
  which(formats$local$fill$patternFill$fgColor$rgb == "FFFFFF00"),
  c("address", "numeric")]

# Styles by name
formats$style$font$name["Normal"]
head(x[x$style_format == "Normal", c("address", "character")])

# In-cell formatting is available in the `character_formatted` column as a data
# frame, one row per substring.
examples <- system.file("/extdata/examples.xlsx", package = "tidyxl")
xlsx_cells(examples)$character_formatted[77]

## ---- echo = TRUE--------------------------------------------------------
x[!is.na(x$comment), c("address", "comment")]

## ---- echo = TRUE-----------------------------------------------------------------------------------------------------
options(width = 120)
y <- xlsx_cells(examples, "Sheet1")
y[!is.na(y$formula),
  c("address", "formula", "is_array", "formula_ref", "formula_group",
    "error", "logical", "numeric", "date", "character")]

## ---- fig.width = 7, fig.height = 5-----------------------------------------------------------------------------------
x <- xlex("MIN(3,MAX(2,A1))")
x

## ---------------------------------------------------------------------------------------------------------------------
xlsx_names(examples)

## ---------------------------------------------------------------------------------------------------------------------
xlsx_validation(examples)

