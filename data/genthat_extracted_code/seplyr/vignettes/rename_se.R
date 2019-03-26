## ----rename1-------------------------------------------------------------
suppressPackageStartupMessages(library("dplyr"))

datasets::mtcars %>%
  rename(cylinders = cyl, gears = gear) %>%
  head()

## ----map1----------------------------------------------------------------
mp <- c("cyl" = "cylinders", "gear" = "gears")
print(mp)

## ----rename2-------------------------------------------------------------
library("seplyr")

datasets::mtcars %.>%
  rename_se(., c("cylinders" := "cyl", "gears" := "gear")) %.>%
  head(.)

## ----swap----------------------------------------------------------------
data.frame(a = 1, b = 2) %.>%
  rename_se(., c('a', 'b') := c('b', 'a'))

