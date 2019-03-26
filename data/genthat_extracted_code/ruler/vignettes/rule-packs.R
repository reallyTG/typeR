## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "README-"
)

library(ruler, quietly = TRUE, warn.conflicts = FALSE)
library(dplyr, quietly = TRUE, warn.conflicts = FALSE)

## ----Data properties of mtcars-------------------------------------------
mtcars %>% summarise(
  nrow_low = nrow(.) > 10,
  nrow_high = nrow(.) < 30,
  ncol = ncol(.) == 12
)

## ----Data rule packs-----------------------------------------------------
my_data_packs <- data_packs(
  my_data_pack_1 = . %>% summarise(
    nrow_low = nrow(.) > 10,
    nrow_high = nrow(.) < 30,
    ncol = ncol(.) == 12
  )
)

## ----Group properties of mtcars------------------------------------------
mtcars %>% group_by(vs, am) %>%
    summarise(any_cyl_6 = any(cyl == 6))

## ----Group rule packs----------------------------------------------------
my_group_packs <- group_packs(
  . %>% group_by(vs, am) %>%
    summarise(any_cyl_6 = any(cyl == 6)),
  .group_vars = c("vs", "am")
)

## ----Column properties of mtcars-----------------------------------------
is_integerish <- function(x) {all(x == as.integer(x))}

mtcars %>%
  summarise_if(is_integerish, funs(mean_low = mean(.) > 0.5))

## ----Column rule packs---------------------------------------------------
my_col_packs <- col_packs(
  my_col_pack_1 = . %>% summarise_if(
    is_integerish,
    rules(mean_low = mean(.) > 0.5)
  ),
  . %>% summarise_at(vars(vs = "vs"), rules(sum(.) > 300))
)

## ----Row properties of mtcars--------------------------------------------
z_score <- function(x) {(x - mean(x)) / sd(x)}

mtcars %>%
  mutate(rowMean = rowMeans(.)) %>%
  transmute(is_common_row_mean = abs(z_score(rowMean)) < 1) %>%
  slice(10:15)

## ----Row rule packs------------------------------------------------------
my_row_packs <- row_packs(
  my_row_pack_1 = . %>% mutate(rowMean = rowMeans(.)) %>%
    transmute(is_common_row_mean = abs(z_score(rowMean)) < 1) %>%
    slice(10:15)
)

## ----Cell properties of mtcars-------------------------------------------
mtcars %>% transmute_if(
    is_integerish,
    funs(is_common = abs(z_score(.)) < 1)
  ) %>%
    slice(20:24)

## ----Cell rule packs-----------------------------------------------------
my_cell_packs <- cell_packs(
  my_cell_pack_1 = . %>% transmute_if(
    is_integerish,
    rules(is_common = abs(z_score(.)) < 1)
  ) %>%
    slice(20:24)
)

