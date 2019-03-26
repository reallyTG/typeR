## ---- echo = F, message = F, warning = F---------------------------------
library(pander)
library(DT)
library(desctable)

options(DT.options = list(#scrollX = T,
                          info = F,
                          search = F,
                          dom = "Brtip",
                          fixedColumns = T))
knitr::opts_chunk$set(message = F, warning = F, screenshot.force = F)

## ------------------------------------------------------------------------
iris %>%
  desctable

desctable(mtcars)

## ------------------------------------------------------------------------
iris %>%
  desctable %>%
  pander

mtcars %>%
  desctable %>%
  datatable

## ------------------------------------------------------------------------
# Strictly equivalent to iris %>% desctable %>% datatable
iris %>%
  desctable(stats = stats_auto) %>%
  datatable

## ------------------------------------------------------------------------
mtcars %>%
  desctable(stats = list("N" = length, "Mean" = mean, "SD" = sd)) %>%
  datatable

## ---- eval = F-----------------------------------------------------------
#  predicate_function ~ stat_function_if_TRUE | stat_function_if_FALSE

## ------------------------------------------------------------------------
iris %>%
  desctable(stats = list("N"      = length,
                         "%/Mean" = is.factor ~ percent | (is.normal ~ mean),
                         "Median" = is.normal ~ NA | median)) %>%
  datatable

## ---- echo = F-----------------------------------------------------------
print(stats_auto)

## ------------------------------------------------------------------------
mtlabels <- c(mpg  = "Miles/(US) gallon",
              cyl  = "Number of cylinders",
              disp = "Displacement (cu.in.)",
              hp   = "Gross horsepower",
              drat = "Rear axle ratio",
              wt   = "Weight (1000 lbs)",
              qsec = "¼ mile time",
              vs   = "V/S",
              am   = "Transmission",
              gear = "Number of forward gears",
              carb = "Number of carburetors")

mtcars %>%
  dplyr::mutate(am = factor(am, labels = c("Automatic", "Manual"))) %>%
  desctable(labels = mtlabels) %>%
  datatable

## ------------------------------------------------------------------------
iris %>%
  group_by(Species) %>%
  desctable -> iris_by_Species

iris_by_Species

## ------------------------------------------------------------------------
str(iris_by_Species)

## ------------------------------------------------------------------------
# With pander output
mtcars %>%
  group_by(cyl) %>%
  desctable %>%
  pander

## ------------------------------------------------------------------------
# With datatable output
iris %>%
  group_by(Petal.Length > 5) %>%
  desctable %>%
  datatable

## ---- message = F, warning = F-------------------------------------------
mtcars %>%
  dplyr::mutate(am = factor(am, labels = c("Automatic", "Manual"))) %>%
  group_by(vs, am, cyl) %>%
  desctable %>%
  datatable

## ------------------------------------------------------------------------
# Strictly equivalent to iris %>% group_by(Species) %>% desctable %>% datatable
iris %>%
  group_by(Species) %>%
  desctable(tests = tests_auto) %>%
  datatable

## ------------------------------------------------------------------------
iris %>%
  group_by(Petal.Length > 5) %>%
  desctable(tests = list(.auto   = tests_auto,
                         Species = ~chisq.test)) %>%
  datatable

## ------------------------------------------------------------------------
mtcars %>%
  dplyr::mutate(am = factor(am, labels = c("Automatic", "Manual"))) %>%
  group_by(am) %>%
  desctable(tests = list(.default = ~wilcox.test,
                         mpg      = ~t.test)) %>%
  datatable

## ------------------------------------------------------------------------
mtcars %>%
  desctable(stats = list("N"              = length,
                         "Sum of squares" = function(x) sum(x^2),
                         "Q1"             = . %>% quantile(prob = .25),
                         "Q3"             = purrr::partial(quantile, probs = .75))) %>%
  datatable

## ------------------------------------------------------------------------
iris %>%
  group_by(Species) %>%
  desctable(tests = list(.auto = tests_auto,
                         Sepal.Width = ~function(f) oneway.test(f, var.equal = F),
                         Petal.Length = ~. %>% oneway.test(var.equal = T),
                         Sepal.Length = ~purrr::partial(oneway.test, var.equal = T))) %>%
  datatable

## ------------------------------------------------------------------------
# This is a contrived example, which would be better solved with a dedicated function
library(survival)

bladder$surv <- Surv(bladder$stop, bladder$event)

bladder %>%
  group_by(rx) %>%
  desctable(tests = list(.default = ~wilcox.test,
                         surv = ~. %>% survdiff %>% .$chisq %>% pchisq(1, lower.tail = F) %>% list(p.value = .))) %>%
  datatable

