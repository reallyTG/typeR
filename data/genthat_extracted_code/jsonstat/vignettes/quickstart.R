## ---- echo = FALSE, message = FALSE--------------------------------------
library(jsonstat)

## ---- eval = F-----------------------------------------------------------
#  install.packages("jsonstat")

## ---- eval = F-----------------------------------------------------------
#  devtools::install_github("zedoul/jsonstat")

## ---- eval = F-----------------------------------------------------------
#  library(jsonstat)

## ------------------------------------------------------------------------
library(jsonstat)
library(dplyr)

x <- read.csv2("galicia.csv", sep = ",")

.plan <- compress_plan("place.of.birth", "geo", "Place of Birth") %>%
  dimension("age.group", "classification", "Age Group") %>%
  dimension("gender", "classification", "Gender") %>%
  dimension("year", "time", "Year") %>%
  dimension("province.of.residence", "geo", "Province of Residence") %>%
  dimension("concept", "metric", "Concept") %>%
  dimension("value", "value", "value")

.extension <- list(id = 3,
                   name = "asdfdsfsd",
                   lol = TRUE,
                   arr = 1:5,
                   training = list(name = "training",
                                   from = "xxxx",
                                   to = "yyyy"),
                   testing = list(name = "testing",
                                  from = "xxxx",
                                  to = "yyyy"))

.dataset <- as.dataset(x, .plan,
              label = paste("Population by province of residence,",
                            "place of birth, age, gender and year",
                            "in Galicia"),
              href = "https://github.com/zedoul/jsonstat",
              extension = .extension)

.collection <- as.collection(.dataset, label = "Comparison",
                             href = "https://github.com/zedoul/jsonstat")

.jsonstat <- toJSON(.collection)

