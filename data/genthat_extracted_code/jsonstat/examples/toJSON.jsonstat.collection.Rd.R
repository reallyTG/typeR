library(jsonstat)


### Name: toJSON.jsonstat.collection
### Title: Convert JSON-stat collection into JSON
### Aliases: toJSON.jsonstat.collection

### ** Examples

library(jsonstat)
library(dplyr)

.plan <- compress_plan("place.of.birth", "geo", "Place of Birth") %>%
  dimension("age.group", "classification", "Age Group") %>%
  dimension("gender", "classification", "Gender") %>%
  dimension("year", "time", "Year") %>%
  dimension("province.of.residence", "geo", "Province of Residence") %>%
  dimension("concept", "metric", "Concept") %>%
  dimension("value", "value", "value")

.dataset <- as.dataset(galicia, .plan,
              label = paste("Population by province of residence,",
                            "place of birth, age, gender and year",
                            "in Galicia"),
              href = "https://github.com/zedoul/jsonstat")

.collection <- as.collection(.dataset, label = "Comparison",
                             href = "https://github.com/zedoul/jsonstat")

.jsonstat <- toJSON(.collection)



