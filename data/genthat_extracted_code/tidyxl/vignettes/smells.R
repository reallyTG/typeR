## ------------------------------------------------------------------------
library(tidyxl)
x <- xlex("MIN(3,MAX(2,A1))")
x

## ---- out.width = "850px", include = FALSE-------------------------------
knitr::include_graphics("enron-constants.png")

## ------------------------------------------------------------------------
library(dplyr)
library(tidyr)
library(purrr)
library(ggplot2)

# The original filename was "barry_tycholiz__848__2002 Plan Worksheet CC107322.xlsx"
sheet <- tidy_xlsx(system.file("extdata/enron-constants.xlsx",
                               package = "tidyxl"),
                   "Detail Breakdown")$data[[1]]
sheet$formula[22]
xlex(sheet$formula[22])

## ------------------------------------------------------------------------
tokens <-
  sheet %>%
  filter(!is.na(formula)) %>%
  select(row, col, formula) %>%
  mutate(tokens = map(formula, xlex)) %>%
  select(-formula)
tokens

## ------------------------------------------------------------------------
constants <-
  tokens %>%
  unnest(tokens) %>%
  filter(type %in% c("error", "bool", "number", "text"))
constants

## ------------------------------------------------------------------------
constants %>%
  count(token, sort = TRUE) %>%
  print(n = Inf)

## ------------------------------------------------------------------------
has_constants <-
  constants %>%
  distinct(row, col) %>%
  mutate(has_constant = TRUE) %>%
  right_join(sheet, by = c("row", "col")) %>%
  filter(!is_blank) %>%
  select(row, col, has_constant) %>%
  replace_na(list(has_constant = FALSE))
has_constants

has_constants %>%
  # filter(row <= 28) %>%
  ggplot(aes(col, row, fill = has_constant)) +
  geom_tile() +
  scale_y_reverse() +
  theme(legend.position = "top")

## ------------------------------------------------------------------------
xlex("MAX(3,MIN(2,4))")

## ------------------------------------------------------------------------
# The original filename was "albert_meyers__1__1-25act.xlsx"
sheet <- tidy_xlsx(system.file("extdata/enron-nested.xlsx",
                               package = "tidyxl"),
                   "Preschedule")$data[[1]]

deepest <-
  sheet %>%
    filter(!is.na(formula)) %>%
    mutate(tokens = map(formula, xlex)) %>%
    select(row, col, tokens) %>%
    unnest(tokens) %>%
    filter(level == max(level)) %>%
    distinct(row, col, level)
deepest

## ------------------------------------------------------------------------
sheet %>%
  filter(row == 171, col == 2) %>%
  pull(formula) # Aaaaaaaaaaarghhhhhhhh!

