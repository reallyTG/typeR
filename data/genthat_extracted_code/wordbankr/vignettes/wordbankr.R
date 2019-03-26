## ---- include=FALSE------------------------------------------------------
library(wordbankr)
library(dplyr)
library(ggplot2)
knitr::opts_chunk$set(message = FALSE, warning = FALSE, cache = FALSE)
theme_set(theme_bw())

## ------------------------------------------------------------------------
get_administration_data(language = "English (American)", form = "WS")
get_administration_data()

## ------------------------------------------------------------------------
get_item_data(language = "Italian", form = "WG")
get_item_data()

## ------------------------------------------------------------------------
get_instrument_data(
  language = "English (American)",
  form = "WS",
  items = c("item_26", "item_46")
)

## ---- fig.width=6, fig.height=4------------------------------------------
animals <- get_item_data(language = "English (American)", form = "WS") %>%
  filter(category == "animals")

## ------------------------------------------------------------------------
animal_data <- get_instrument_data(language = "English (American)",
                                   form = "WS",
                                   items = animals$item_id,
                                   administrations = TRUE)

## ---- fig.width=6, fig.height=4------------------------------------------
animal_summary <- animal_data %>%
  mutate(produces = value == "produces") %>%
  group_by(age, data_id) %>%
  summarise(num_animals = sum(produces, na.rm = TRUE)) %>%
  group_by(age) %>%
  summarise(median_num_animals = median(num_animals, na.rm = TRUE))
  
ggplot(animal_summary, aes(x = age, y = median_num_animals)) +
  geom_point() +
  labs(x = "Age (months)", y = "Median animal words producing")

## ------------------------------------------------------------------------
get_instruments()

## ------------------------------------------------------------------------
get_sources(form = "WG")
get_sources(language = "Spanish (Mexican)", admin_data = TRUE) %>%
  select(source_id, name, dataset, instrument_form, n_admins, age_min, age_max)

## ------------------------------------------------------------------------
eng_ws_data <- get_instrument_data(language = "English (American)",
                                   form = "WS",
                                   items = c("item_1", "item_42"),
                                   administrations = TRUE,
                                   iteminfo = TRUE)
fit_aoa(eng_ws_data)
fit_aoa(eng_ws_data, measure = "understands", method = "glmrob", proportion = 0.7)

## ------------------------------------------------------------------------
get_crossling_items()

## ------------------------------------------------------------------------
get_crossling_data(uni_lemmas = c("hat", "nose")) %>%
  ungroup() %>%
  select(language, uni_lemma, definition, age, n_children, comprehension,
         production, comprehension_sd, production_sd) %>%
  arrange(uni_lemma)

