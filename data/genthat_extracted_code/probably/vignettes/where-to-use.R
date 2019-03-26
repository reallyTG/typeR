## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", fig.width = 7, fig.height = 6, fig.align = "center")

## ---- message=FALSE, warning=FALSE---------------------------------------
library(parsnip)
library(probably)
library(dplyr)
data("lending_club")

# I think it makes more sense to have "good" as the first level
# By default it comes as the second level
lending_club <- lending_club %>%
  mutate(Class = relevel(Class, "good"))

# There are a number of columns in this data set, but we will only use a few
# for this example
lending_club <- select(lending_club, Class, annual_inc, verification_status, sub_grade)

lending_club

## ------------------------------------------------------------------------
# 70% train, 30% test
set.seed(123)
n <- nrow(lending_club)
prop_train <- .7
train_idx <- sample(seq_len(n), floor(.7 * n))

lending_train <- lending_club[train_idx,]
lending_test  <- lending_club[-train_idx,]

## ------------------------------------------------------------------------
count(lending_train, Class)

## ------------------------------------------------------------------------
logi_reg <- logistic_reg()
logi_reg_glm <- logi_reg %>% set_engine("glm")

# A small model specification that defines the type of model you are 
# using and the engine
logi_reg_glm

# Fit the model
logi_reg_fit <- fit(
  logi_reg_glm, 
  formula = Class ~ annual_inc + verification_status + sub_grade, 
  data = lending_train
)

logi_reg_fit

## ------------------------------------------------------------------------
predictions <- logi_reg_fit %>%
  predict(new_data = lending_test, type = "prob")

head(predictions, n = 2)

lending_test_pred <- bind_cols(predictions, lending_test)

lending_test_pred

## ------------------------------------------------------------------------
hard_pred_0.5 <- lending_test_pred %>%
  mutate(.pred = make_two_class_pred(.pred_good, levels(Class), threshold = .5)) %>%
  select(Class, contains(".pred"))

hard_pred_0.5 %>% 
  count(.truth = Class, .pred)

## ------------------------------------------------------------------------
hard_pred_0.75 <- lending_test_pred %>%
  mutate(.pred = make_two_class_pred(.pred_good, levels(Class), threshold = .75)) %>%
  select(Class, contains(".pred"))

hard_pred_0.75 %>% 
  count(.truth = Class, .pred)

## ------------------------------------------------------------------------
library(yardstick)

# Currently yardstick can't deal with the class_pred objects that come from
# probably, but it will be able to soon!
hard_pred_0.5 <- mutate(hard_pred_0.5, .pred = as.factor(.pred))
hard_pred_0.75 <- mutate(hard_pred_0.75, .pred = as.factor(.pred))

sens(hard_pred_0.5, Class, .pred)
spec(hard_pred_0.5, Class, .pred)

sens(hard_pred_0.75, Class, .pred)
spec(hard_pred_0.75, Class, .pred)

## ------------------------------------------------------------------------
j_index(hard_pred_0.5, Class, .pred)
j_index(hard_pred_0.75, Class, .pred)

## ------------------------------------------------------------------------
threshold_data <- lending_test_pred %>%
  threshold_perf(Class, .pred_good, thresholds = seq(0.5, 1, by = 0.0025))

threshold_data %>%
  filter(.threshold %in% c(0.5, 0.6, 0.7))

## ------------------------------------------------------------------------
library(ggplot2)

threshold_data <- threshold_data %>%
  filter(.metric != "distance") %>%
  mutate(group = case_when(
    .metric == "sens" | .metric == "spec" ~ "1",
    TRUE ~ "2"
  ))

max_j_index_threshold <- threshold_data %>%
  filter(.metric == "j_index") %>%
  filter(.estimate == max(.estimate)) %>%
  pull(.threshold)

ggplot(threshold_data, aes(x = .threshold, y = .estimate, color = .metric, alpha = group)) +
  geom_line() +
  theme_minimal() +
  scale_color_viridis_d(end = 0.9) +
  scale_alpha_manual(values = c(.4, 1), guide = "none") +
  geom_vline(xintercept = max_j_index_threshold, alpha = .6, color = "grey30") +
  labs(
    x = "'Good' Threshold\n(above this value is considered 'good')",
    y = "Metric Estimate",
    title = "Balancing performance by varying the threshold",
    subtitle = "Sensitivity or specificity alone might not be enough!\nVertical line = Max J-Index"
  )

## ------------------------------------------------------------------------
threshold_data %>%
  filter(.threshold == max_j_index_threshold)

