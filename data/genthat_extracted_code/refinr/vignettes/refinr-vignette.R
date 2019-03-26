## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(refinr)
x <- c("Acme Pizza, Inc.", "AcMe PiZzA, Inc.", "ACME PIZZA COMPANY", "acme pizza LLC")
key_collision_merge(x)

## ------------------------------------------------------------------------
# Set bus_suffix to FALSE to see the difference (only the first two strings get merged).
key_collision_merge(x, bus_suffix = FALSE)

## ------------------------------------------------------------------------
key_collision_merge(x, dict = c("Acme Pizza, Incorporated"))

## ------------------------------------------------------------------------
x <- c("Bakersfield Highschool", "BAKERSFIELD high", "high school, bakersfield")
key_collision_merge(x, ignore_strings = c("high", "school", "highschool"))

## ------------------------------------------------------------------------
key_collision_merge(x, ignore_strings = c("high", "school", "highschool"), dict = c("Bakersfield High School"))

## ------------------------------------------------------------------------
x <- c("Acme Pizza, Inc.", "ACME PIZA COMPANY", "Acme Pizzazza LLC")
n_gram_merge(x)

## ------------------------------------------------------------------------
n_gram_merge(x, weight = c(d = 1, i = 0.4, s = 0.2, t = 0.2))

## ------------------------------------------------------------------------
n_gram_merge(x, method = "soundex", useBytes = TRUE)

## ------------------------------------------------------------------------
x <- c("Bakersfield Highschool", "BAKERSFIELD high", "high school, bakersfield")
n_gram_merge(x, ignore_strings = c("high", "school", "highschool"))

## ---- results='asis', message=FALSE--------------------------------------
library(dplyr)

x <- c(
  "Clemsson University", 
  "university-of-clemson", 
  "CLEMSON", 
  "Clem son, U.", 
  "college, clemson u", 
  "M.I.T.", 
  "Technology, Massachusetts' Institute of", 
  "Massachusetts Inst of Technology", 
  "UNIVERSITY:  mit"
)

ignores <- c("university", "college", "u", "of", "institute", "inst")
x_refin <- x %>% 
  key_collision_merge(ignore_strings = ignores) %>% 
  n_gram_merge(ignore_strings = ignores)

# Print results.
cat(paste(x_refin, collapse = "<br />"))
# Create df for comparing the original values to the edited values.
# This is especially useful for larger input vectors.
inspect_results <- data_frame(original_values = x, edited_values = x_refin) %>% 
  mutate(equal = original_values == edited_values)

# Display only the values that were edited by refinr.
knitr::kable(
  inspect_results[!inspect_results$equal, c("original_values", "edited_values")], 
  format = "html", 
  table.attr = "style='width:100%;'"
)

