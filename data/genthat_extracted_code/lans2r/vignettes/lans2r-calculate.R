## ---- message=FALSE, warning=FALSE---------------------------------------
library(lans2r)
library(dplyr)
library(knitr)

## ------------------------------------------------------------------------
set.seed(123) # set random seed
test_data <- 
  data_frame(
    ROI = rep(1:5, times = 4),
    variable = rep(LETTERS[1:4], each = 5),
    value = rpois(20,lambda = 10),
    sigma = sqrt(value),
    data_type = "raw"
  )
kable(test_data, d = 2)

## ------------------------------------------------------------------------
# functions to calculate values and errors and derive names from the names of the variables used
# note that they all have to take the same parameters (even if they are not used)
my_value_fun <- function(x, y, x.err, y.err) x*y
my_error_fun <- function(x, y, x.err, y.err) my_value_fun(x, y, x.err, y.err) * sqrt((x.err/x)^2 + (y.err/y)^2)
my_name_fun <- function(x, y, x.err, y.err) paste0(deparse(substitute(x)), "*", deparse(substitute(y)))
  
derived_data <- 
  test_data %>% 
  calculate(
    # data type of the derived quantities (can be anything descriptive)
    data_type = "derived",
    # which sets of variables to use for calculations
    c(D, C, `D sigma`, `C sigma`), c(B, A, `B sigma`, `A sigma`), c(B, C, `B sigma`, `C sigma`),
    # the function to make the calculations
    value_fun = my_value_fun, error_fun = my_error_fun, name_fun = my_name_fun)
kable(derived_data, d = 2)

## ------------------------------------------------------------------------
my_value_fun <- function(x, y, x.err, y.err) x+y
my_error_fun <- function(x, y, x.err, y.err) sqrt(x.err^2 + y.err^2)
my_name_fun <- function(x, y, x.err, y.err) paste0(deparse(substitute(x)), "+", deparse(substitute(y)))

derived_data2 <-
  derived_data %>% 
  calculate(
    # data type of the derived quantities (can be anything descriptive)
    data_type = "derived2",
    # which sets of variables to use for calculations
    c(D, C, `D sigma`, `C sigma`), c(`B*A`, `C`, `B*A sigma`, `C sigma`),
    # the function to make the calculations
    value_fun = my_value_fun, error_fun = my_error_fun, name_fun = my_name_fun)
kable(derived_data2, d = 2)

## ------------------------------------------------------------------------
derived_data3 <-
  derived_data2 %>% 
  calculate(
    # data type of the derived quantities (can be anything descriptive)
    data_type = "special",
    # which sets of variables to use for calculations
    c("my_var", A, B, C),
    # the function to make the calculations
    value_fun = function(name, x, y, z) x+y^2+z^3/sum(x),
    name_fun = function(name, x, y, z) name)
kable(derived_data3, d = 2)

## ---- fig.width = 9, fig.height = 8--------------------------------------
library(ggplot2)
derived_data3 %>% 
  ggplot() +
  aes(x = ROI, y = value, ymin = value-sigma, ymax = value+sigma, color = variable) +
  geom_errorbar() +
  geom_point() +
  facet_wrap(~data_type, scales = "free")

## ------------------------------------------------------------------------
derived_data3 %>% spread_data() %>% kable(d = 2)
derived_data3 %>% spread_data(errors = FALSE) %>% kable(d = 2)

