## ----exi-----------------------------------------------------------------
suppressPackageStartupMessages(library("dplyr"))
packageVersion("dplyr")

colnames(starwars)

starwars %>%
  group_by(homeworld) %>%
  summarise(mean_height = mean(height, na.rm = TRUE),
            mean_mass = mean(mass, na.rm = TRUE),
            count = n()) 

## ----exc-----------------------------------------------------------------
library("seplyr")

starwars %>%
  group_by_se("homeworld") %>%
  summarize_se(c("mean_height" := "mean(height, na.rm = TRUE)",
                 "mean_mass" := "mean(mass, na.rm = TRUE)",
                 "count" := "n()"))

## ----exp3----------------------------------------------------------------
grouped_mean <- function(data, 
                         grouping_variables, 
                         value_variables,
                         count_name = "count") {
  result_names <- paste0("mean_", 
                         value_variables)
  expressions <- paste0("mean(", 
                        value_variables, 
                        ", na.rm = TRUE)")
  calculation <- result_names := expressions
  data %>%
    group_by_se(grouping_variables) %>%
    summarize_se(c(calculation,
                   count_name := "n()")) %>%
    ungroup()
}

starwars %>% 
  grouped_mean(grouping_variables = c("eye_color", "skin_color"),
               value_variables = c("mass", "birth_year"))

## ----rlde1---------------------------------------------------------------
packageVersion("dplyr")
packageVersion("rlang")
packageVersion("tidyselect")

my_var <- "homeworld"

starwars %>%
  group_by(.data[[my_var]]) %>%
  summarise_at(vars(height:mass), mean, na.rm = TRUE)

## ----rlde2---------------------------------------------------------------
# wrong
starwars %>%
  group_by(!!my_var) %>%
  summarise_at(vars(height:mass), mean, na.rm = TRUE)

## ----rlde3---------------------------------------------------------------
# correct, or at least appears to work
starwars %>%
  group_by(!!rlang::sym(my_var)) %>%
  summarise_at(vars(height:mass), mean, na.rm = TRUE)

## ----rlde4---------------------------------------------------------------
# correct, or at least appears to work
starwars %>%
  group_by(.data[[!!my_var]]) %>%
  summarise_at(vars(height:mass), mean, na.rm = TRUE)

## ----rlde5, error=TRUE---------------------------------------------------
# errors-out
starwars %>%
  group_by(.data[[!!rlang::sym(my_var)]]) %>%
  summarise_at(vars(height:mass), mean, na.rm = TRUE)

## ----rdse1, error=TRUE---------------------------------------------------
# correct, or at least appears to work
starwars %>%
  select(my_var) %>%
  head(n=2)

# errors-out
starwars %>%
  group_by(my_var) %>%
  head(n=2)

## ----rdsel2, error=TRUE--------------------------------------------------
my_var <- "homeworld"
# selects height column
starwars %>%
  select(my_var) %>%
  head(n=2)

# perhaps different data with an extra column
starwars_plus <- starwars %>%
  mutate(my_var = seq_len(nrow(starwars)))

# same code now selects my_var column
starwars_plus %>%
  select(my_var) %>%
  head(n=2)

# original official example code now errors-out
starwars_plus %>%
  group_by(.data[[my_var]]) %>%
  summarise_at(vars(height:mass), mean, na.rm = TRUE)

## ----rlangu--------------------------------------------------------------
starwars %>%
  select(!!my_var) %>%
  head(n=2)

## ----sesel---------------------------------------------------------------
print(my_var)

# selects homeworld column (the value specified my_var) independent of
# any coincidence between variable name and column names.
starwars_plus %>% 
  select_se(my_var) %>%
  head(n=2)

