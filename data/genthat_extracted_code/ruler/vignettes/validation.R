## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "README-"
)

library(ruler, quietly = TRUE, warn.conflicts = FALSE)
library(dplyr, quietly = TRUE, warn.conflicts = FALSE)

# Packs from previous vignette
my_data_packs <- data_packs(
  my_data_pack_1 = . %>% summarise(
    nrow_low = nrow(.) > 10,
    nrow_high = nrow(.) < 30,
    ncol = ncol(.) == 12
  )
)

my_group_packs <- group_packs(
  . %>% group_by(vs, am) %>%
    summarise(any_cyl_6 = any(cyl == 6)),
  .group_vars = c("vs", "am")
)

is_integerish <- function(x) {all(x == as.integer(x))}

my_col_packs <- col_packs(
  my_col_pack_1 = . %>% summarise_if(
    is_integerish,
    rules(mean_low = mean(.) > 0.5)
  ),
  . %>% summarise_at(vars(vs = "vs"), rules(sum(.) > 300))
)

z_score <- function(x) {(x - mean(x)) / sd(x)}

my_row_packs <- row_packs(
  my_row_pack_1 = . %>% mutate(rowMean = rowMeans(.)) %>%
    transmute(is_common_row_mean = abs(z_score(rowMean)) < 1) %>%
    slice(10:15)
)

my_cell_packs <- cell_packs(
  my_cell_pack_1 = . %>% transmute_if(
    is_integerish,
    rules(is_common = abs(z_score(.)) < 1)
  ) %>%
    slice(20:24)
)

## ----Simple expose-------------------------------------------------------
mtcars %>%
  expose(my_group_packs) %>%
  get_exposure()

## ----Expose can not remove obeyers---------------------------------------
mtcars %>%
  expose(my_group_packs, .remove_obeyers = FALSE) %>%
  get_exposure()

## ----Renaming pack-------------------------------------------------------
mtcars %>%
  expose(new_group_pack = my_group_packs[[1]]) %>%
  get_report()

## ----Two-step expose-----------------------------------------------------
mtcars_one_step <- mtcars %>%
  expose(my_data_packs, my_col_packs)

mtcars_two_step <- mtcars %>%
  expose(my_data_packs) %>%
  expose(my_col_packs)

identical(mtcars_one_step, mtcars_two_step)

## ----Expose can guess----------------------------------------------------
mtcars %>%
  expose(some_data_pack = . %>% summarise(nrow = nrow(.) == 10)) %>%
  get_exposure()

## ----Expose can change rule separator------------------------------------
regular_col_packs <- col_packs(
  . %>% summarise_all(rules(mean(.) > 1))
)

irregular_col_packs <- col_packs(
  . %>% summarise_all(rules(mean(.) > 1, .prefix = "@_@"))
)

regular_report <- mtcars %>%
  expose(regular_col_packs) %>%
  get_report()

irregular_report <- mtcars %>%
  expose(irregular_col_packs, .rule_sep = inside_punct("@_@")) %>%
  get_report()

identical(regular_report, irregular_report)

# Note suffix '_' after column names
mtcars %>%
  expose(irregular_col_packs, .rule_sep = "@_@") %>%
  get_report()

## ----Acting after exposure-----------------------------------------------
trigger_one_pack <- function(.tbl) {
  packs_number <- .tbl %>%
    get_packs_info() %>%
    nrow()
  
  packs_number > 1
}

actor_one_pack <- function(.tbl) {
  cat("More than one pack was applied.\n")
  
  invisible(.tbl)
}

mtcars %>%
  expose(my_col_packs, my_row_packs) %>%
  act_after_exposure(
    .trigger = trigger_one_pack,
    .actor = actor_one_pack
  ) %>%
  invisible()

