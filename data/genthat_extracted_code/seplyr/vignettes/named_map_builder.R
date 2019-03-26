## ----ex1-----------------------------------------------------------------
library("wrapr")

'a' := 5

c('a' := 5, 'b' := 6)

c('a', 'b') := c(5, 6)

## ----key1----------------------------------------------------------------
key = 'keycode'
key := 'value'

## ----ex2-----------------------------------------------------------------
library("seplyr")

datasets::iris %.>%
  summarize_se(., "Mean_Sepal_Length" := "mean(Sepal.Length)")

## ----ex3-----------------------------------------------------------------
datasets::iris %.>%
  group_by_se(., "Species") %.>%
  summarize_se(., c("Mean_Sepal_Length" := "mean(Sepal.Length)",
                    "Mean_Sepal_Width" := "mean(Sepal.Width)"))

## ----ex4-----------------------------------------------------------------
resultColumn <- "summary_value"
datasets::iris %.>%
  group_by_se(., "Species") %.>%
  summarize_se(., resultColumn := "mean(Sepal.Length)")

