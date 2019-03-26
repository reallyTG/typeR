library(forestmodel)


### Name: forest_model
### Title: Produce a forest plot based on a regression model
### Aliases: forest_model

### ** Examples


library("survival")
library("dplyr")
pretty_lung <- lung %>%
  transmute(time,
            status,
            Age = age,
            Sex = factor(sex, labels = c("Male", "Female")),
            ECOG = factor(lung$ph.ecog),
            `Meal Cal` = meal.cal)

print(forest_model(coxph(Surv(time, status) ~ ., pretty_lung)))

# Example with custom panels

panels <- list(list(width = 0.03),
  list(width = 0.1, display = ~variable, fontface = "bold", heading = "Variable"),
  list(width = 0.1, display = ~level),
  list(width = 0.05, display = ~n, hjust = 1, heading = "N"),
  list(width = 0.05, display = ~n_events, width = 0.05, hjust = 1, heading = "Events"),
  list(width = 0.05,
    display = ~replace(sprintf("%0.1f", person_time/365.25), is.na(person_time), ""),
    heading = "Person-\nYears", hjust = 1),
  list(width = 0.03, item = "vline", hjust = 0.5),
  list(width = 0.55, item = "forest", hjust = 0.5, heading = "Hazard ratio", linetype = "dashed",
    line_x = 0),
  list(width = 0.03, item = "vline", hjust = 0.5),
  list(width = 0.12, display = ~ifelse(reference, "Reference", sprintf("%0.2f (%0.2f, %0.2f)",
    trans(estimate), trans(conf.low), trans(conf.high))), display_na = NA),
  list(width = 0.05,
    display = ~ifelse(reference, "", format.pval(p.value, digits = 1, eps = 0.001)),
    display_na = NA, hjust = 1, heading = "p"),
  list(width = 0.03)
)
forest_model(coxph(Surv(time, status) ~ ., pretty_lung), panels)

data_for_lm <- data_frame(x = rnorm(100, 4),
                          y = rnorm(100, 3, 0.5),
                          z = rnorm(100, 2, 2),
                          outcome = 3 * x - 2 * y + 4 * z + rnorm(100, 0, 0.1))

print(forest_model(lm(outcome ~ ., data_for_lm)))

data_for_logistic <- data_for_lm %>% mutate(
  outcome = (0.5 * (x - 4) * (y - 3) * (z - 2) + rnorm(100, 0, 0.05)) > 0.5
)

print(forest_model(glm(outcome ~ ., binomial(), data_for_logistic)))



