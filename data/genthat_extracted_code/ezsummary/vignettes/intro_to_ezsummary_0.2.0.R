## ----data----------------------------------------------------------------
dim(mtcars)
head(mtcars)

## ----ezmarkup, message=FALSE---------------------------------------------
library(dplyr)
library(ezsummary)
library(knitr)

mtcars %>% 
  select(1:3) %>%
  ezmarkup(".[. (.)]") %>%
  head()

mtcars %>% 
  select(1:3) %>%
  ezmarkup(".[. ~~.~~ :-)]") %>%
  head()

## ----ezsummary_q_1-------------------------------------------------------
mtcars %>% ezsummary(n = T, quantile = T) %>% kable()

## ----ezsummary_q_2-------------------------------------------------------
mtcars %>% 
  ezsummary(
    extra = c(
      max = "max(., na.rm = T)",
      above20 = "sum(. > 20, na.rm = T)"
    )
  ) %>%
  kable()

## ----ezsummary_q_3-------------------------------------------------------
mtcars %>%
  group_by(cyl) %>%
  ezsummary(digits = 1) %>%
  kable()

## ----ezsummary_q_4-------------------------------------------------------
mtcars %>%
  group_by(cyl) %>%
  ezsummary(flavor = "wide", digits = 1) %>% 
  kable()

## ----ezsummary_q_5-------------------------------------------------------
mtcars %>%
  group_by(carb) %>%
  ezsummary(flavor = "wide", digits = 1, unit_markup = '[. (.)]') %>%
  kable()

## ----ezsummary_q_6-------------------------------------------------------
mtcars %>%
  ezsummary(rounding_type = "ceiling") %>%
  kable()

## ----ezsummary_c_1-------------------------------------------------------
mtcars %>%
  select(cyl, vs, am, gear, carb) %>%
  ezsummary_c() %>%
  kable()

## ----ezsummary_c_2-------------------------------------------------------
mtcars %>%
  group_by(cyl) %>%
  select(cyl, vs, am, gear, carb) %>%
  ezsummary_c(p_type = "percent", flavor = "wide", 
              unit_markup = "[. (.)]", digits = 0) %>%
  kable()

## ----ezsummary_1---------------------------------------------------------
mtcars %>%
  select(mpg, cyl, disp, gear) %>%
  var_types("qcqc") %>%
  ezsummary(n = T) %>%
  kable()

## ----ezsummary_2---------------------------------------------------------
mtcars %>%
  select(mpg, cyl, disp, gear) %>%
  var_types("qcqc") %>%
  group_by(cyl) %>%
  ezsummary(flavor = "wide", unit_markup = "[. (.)]", 
            p_type = "percent", digits = 1) %>%
  kable(col.names = c("", "4 Cylinders", "6 Cylinders", "8 Cylinder"))

