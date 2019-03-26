## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "README-"
)
options(tibble.print_min = 3, tibble.print_max = 3)

## ----setup, include = FALSE----------------------------------------------
library(dplyr, quietly = TRUE, warn.conflicts = FALSE)
library(keyholder, quietly = TRUE, warn.conflicts = FALSE)

## ----Create basic example tibble-----------------------------------------
mtcars_tbl <- mtcars %>% as_tibble()

## ----set keys by assigning-----------------------------------------------
mtcars_tbl_keyed <- mtcars_tbl
keys(mtcars_tbl_keyed) <- tibble(id = 1:nrow(mtcars_tbl_keyed))

mtcars_tbl %>% assign_keys(tibble(id = 1:nrow(.)))

## ----set keys by key_by--------------------------------------------------
mtcars_tbl %>% key_by(vs, am)

mtcars_tbl %>% key_by(starts_with("c"))

mtcars_tbl %>% key_by(starts_with("c"), .exclude = TRUE)

  # Scoped variants
mtcars_tbl %>% key_by_all()

# One can also rename variables before keying by supplying .funs
mtcars_tbl %>% key_by_if(rlang::is_integerish, .funs = toupper)

mtcars_tbl %>% key_by_at(c("vs", "am"))

## ----unkey---------------------------------------------------------------
mtcars_tbl_keyed <- mtcars_tbl %>% key_by(vs, am)

# Good
mtcars_tbl_keyed %>% unkey()

# Bad
attr(mtcars_tbl_keyed, "keys") <- NULL
mtcars_tbl_keyed

## ----get keys with keys--------------------------------------------------
mtcars_tbl %>% keys()

mtcars_tbl %>% key_by(vs, am) %>% keys()

## ----get keys with raw_keys----------------------------------------------
mtcars_tbl %>% raw_keys()

mtcars_tbl %>% key_by(vs, am) %>% raw_keys()

## ----get keys with pull_key----------------------------------------------
mtcars_tbl %>% key_by(vs, am) %>% pull_key(vs)

## ----remove keys---------------------------------------------------------
mtcars_tbl %>% key_by(vs, mpg) %>% remove_keys(vs)

mtcars_tbl %>% key_by(vs, mpg) %>% remove_keys(everything(), .unkey = TRUE)

  # Scoped variants
# Identical to previous one
mtcars_tbl %>% key_by(vs, mpg) %>% remove_keys_all(.unkey = TRUE)

mtcars_tbl %>% key_by(vs, mpg) %>% remove_keys_if(rlang::is_integerish)

## ----restore keys--------------------------------------------------------
mtcars_tbl_keyed <- mtcars_tbl %>%
  key_by(vs, mpg) %>%
  mutate(vs = 1, mpg = 0)
mtcars_tbl_keyed

mtcars_tbl_keyed %>% restore_keys(vs)

mtcars_tbl_keyed %>% restore_keys(vs, .remove = TRUE)

mtcars_tbl_keyed %>% restore_keys(vs, mpg, .unkey = TRUE)

mtcars_tbl_keyed %>% restore_keys(vs, mpg, .remove = TRUE, .unkey = TRUE)

  # Scoped variants
mtcars_tbl_keyed %>% restore_keys_all()

mtcars_tbl_keyed %>% restore_keys_if(rlang::is_integerish, .remove = TRUE)

## ----restore keys grouping-----------------------------------------------
mtcars_tbl_keyed %>% group_by(vs, mpg)

mtcars_tbl_keyed %>% group_by(vs, mpg) %>% restore_keys(vs, mpg)

## ----rename keys---------------------------------------------------------
mtcars_tbl %>% key_by(vs, am) %>% rename_keys(Vs = vs)

  # Scoped variants
mtcars_tbl %>% key_by(vs, am) %>% rename_keys_all(.funs = toupper)

## ----reaction to subset--------------------------------------------------
mtcars_tbl_subset <- mtcars_tbl %>% key_by(vs, am) %>%
  `[`(c(3, 18, 19), c(2, 8, 9))

mtcars_tbl_subset

keys(mtcars_tbl_subset)

## ----dplyr verbs---------------------------------------------------------
mtcars_tbl_keyed <- mtcars_tbl %>% key_by(vs, am)

mtcars_tbl_keyed %>% select(gear, mpg)

mtcars_tbl_keyed %>% summarise(meanMPG = mean(mpg))

mtcars_tbl_keyed %>% filter(vs == 1) %>% keys()

mtcars_tbl_keyed %>% arrange_at("mpg") %>% keys()

band_members %>% key_by(name) %>%
  semi_join(band_instruments, by = "name") %>%
  keys()

