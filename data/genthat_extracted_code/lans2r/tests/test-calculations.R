context("Calculations")

# test data
a <- data_frame(variable = "A", ROI = 1:5, value = rpois(5, 20), sigma = 0.1, data_type = "temp")
b <- data_frame(variable = "B", ROI = 1:5, value = rpois(5, 20), sigma = 0.2, data_type = "temp")
c <- data_frame(variable = "C", ROI = 1:5, value = rpois(5, 20), sigma = 0.2, data_type = "temp")
d <- data_frame(variable = "D", ROI = 1:5, value = rpois(5, 20), sigma = 0.2, data_type = "temp")
test_data <- bind_rows(a, b, c, d)

test_that("test that calculate works properly", {
  
  # error checks
  expect_error(calculate(data_frame()), "column not in dataset: 'variable'")
  expect_error(calculate(data_frame(variable = "A")), "column not in dataset: 'value'")
  expect_error(calculate(data_frame(variable = "A", value = 5)), "column not in dataset: 'data_type'")
  
  
  # testing calculate
  my_value_fun <- function(x, y, x.err, y.err) x*y
  my_error_fun <- function(x, y, x.err, y.err) my_value_fun(x, y, x.err, y.err) * sqrt((x.err/x)^2 + (y.err/y)^2)
  my_name_fun <- function(x, y, ...) paste0(deparse(substitute(x)), "*", deparse(substitute(y)))
  
  expect_message(
    test_data %>% 
    calculate(
      data_type = "derived",
      c(D, C, `D sigma`, `C sigma`), c(B, A, `B sigma`, `A sigma`),
      value_fun = my_value_fun, error_fun = my_error_fun, name_fun = my_name_fun), 
    "10 'derived' values \\+ errors calculated")
  
  expect_silent(
    deriv_data <- test_data %>% 
      calculate(
        data_type = "derived", quiet = T,
        c(D, C, `D sigma`, `C sigma`), c(B, A, `B sigma`, `A sigma`),
        value_fun = my_value_fun, error_fun = my_error_fun, name_fun = my_name_fun))

  # data checks
  expect_equal(deriv_data %>% nrow(), nrow(test_data) + nrow(a) * 2)
  expect_equal(deriv_data %>% filter(data_type == "derived") %>% {.$variable} %>% unique(),
               c("D*C", "B*A"))
  expect_equal(
    left_join(b, a, by="ROI") %>% mutate(value = value.x*value.y) %>% {.$value},
    deriv_data %>% filter(variable == "B*A") %>% {.$value})
  expect_equal(
    left_join(d, c, by="ROI") %>% mutate(value = value.x*value.y) %>% {.$value},
    deriv_data %>% filter(variable == "D*C") %>% {.$value})
  expect_equal(
    left_join(b, a, by="ROI") %>% 
      mutate(error = my_error_fun(value.x, value.y, sigma.x, sigma.y)) %>% {.$error},
    deriv_data %>% filter(variable == "B*A") %>% {.$sigma})
  expect_equal(
    left_join(d, c, by="ROI") %>% 
      mutate(error  = my_error_fun(value.x, value.y, sigma.x, sigma.y)) %>% {.$error},
    deriv_data %>% filter(variable == "D*C") %>% {.$sigma})
  
  # other parameters check (filter_new)
  expect_message(
    filtered_deriv <- 
      test_data %>% 
      calculate(
        data_type = "derived",
        c(D, C, `D sigma`, `C sigma`), c(B, A, `B sigma`, `A sigma`),
        value_fun = my_value_fun, error_fun = my_error_fun, name_fun = my_name_fun,
        filter_new = variable == "B*A"), "variable == \"B\\*A\"")
  expect_equal(nrow(filtered_deriv), nrow(test_data) + nrow(a))
})

test_that("test that calculate ratios works properly", {
  expect_message(test_data %>% calculate_ratios(c(`A`, `B`), c(`C`, `D`)), "10 'ratio' values \\+ errors calculated")
  expect_silent(ratio_data <- test_data %>% calculate_ratios(c(`A`, `B`), c(`C`, `D`), quiet = T))
  
  # data checks
  expect_equal(ratio_data$data_type %>% unique(), c("temp", "ratio"))
  expect_equal(ratio_data %>% filter(data_type == "ratio") %>% {.$variable} %>% unique(), c("A/B", "C/D"))
  
  expect_equal(
    left_join(a, b, by="ROI") %>% mutate(value = value.x/value.y) %>% {.$value},
    ratio_data %>% filter(variable == "A/B") %>% {.$value})
  
  expect_equal(
    left_join(c, d, by="ROI") %>% mutate(value = value.x/value.y) %>% {.$value},
    ratio_data %>% filter(variable == "C/D") %>% {.$value})
  
  # error calculation (based o ion count errors)
  expect_equal(
    left_join(a, b, by="ROI") %>% mutate(error = lans2r:::iso.errR(value.y,value.x)) %>% {.$error},
    ratio_data %>% filter(variable == "A/B") %>% {.$sigma})
  
  # other parameters check (filter_new)
  expect_equal(
    test_data %>% calculate_ratios(c(`A`, `B`), c(`C`, `D`), quiet = T, filter_new = variable == "A/B") %>% 
      filter(data_type == "ratio") %>% {.$variable} %>% unique(), "A/B"
  )
})

test_that("test that calculate abundances works properly", {
  expect_message(test_data %>% calculate_abundances(c(`A`, `B`), c(`C`, `D`)), "10 'abundance' values \\+ errors calculated")
  expect_silent(ab_data <- test_data %>% calculate_abundances(c(`A`, `B`), c(`C`, `D`), quiet = T))
  
  # data checks
  expect_equal(ab_data$data_type %>% unique(), c("temp", "abundance"))
  expect_equal(ab_data %>% filter(data_type == "abundance") %>% {.$variable} %>% unique(), c("A F", "C F"))
  
  expect_equal(
    left_join(a, b, by="ROI") %>% mutate(value = value.x/(value.x + value.y)) %>% {.$value},
    ab_data %>% filter(variable == "A F") %>% {.$value})
  
  expect_equal(
    left_join(c, d, by="ROI") %>% mutate(value = value.x/(value.x + value.y)) %>% {.$value},
    ab_data %>% filter(variable == "C F") %>% {.$value})
  
  # error calculation (based o ion count errors)
  expect_equal(
    left_join(a, b, by="ROI") %>% mutate(error = lans2r:::iso.errF(value.y,value.x)) %>% {.$error},
    ab_data %>% filter(variable == "A F") %>% {.$sigma})
  
  # other parameters check (filter_new)
  expect_equal(
    test_data %>% calculate_abundances(c(`A`, `B`), c(`C`, `D`), quiet = T, filter_new = variable == "A F") %>% 
      filter(data_type == "abundance") %>% {.$variable} %>% unique(), "A F"
  )
  
})

test_that("test that calculate sums works properly", {
  
  expect_message(test_data %>% calculate_sums(c(`A`, `B`), c(`C`, `D`)), "10 'ion_sum' values \\+ errors calculated")
  expect_silent(sum_data <- test_data %>% calculate_sums(c(`A`, `B`), c(`C`, `D`), quiet = T))
  
  # data checks
  expect_equal(sum_data$data_type %>% unique(), c("temp", "ion_sum"))
  expect_equal(sum_data %>% filter(data_type == "ion_sum") %>% {.$variable} %>% unique(), c("A+B", "C+D"))
  
  expect_equal(
    left_join(a, b, by="ROI") %>% mutate(value = value.x + value.y) %>% {.$value},
    sum_data %>% filter(variable == "A+B") %>% {.$value})
  
  expect_equal(
    left_join(c, d, by="ROI") %>% mutate(value = value.x + value.y) %>% {.$value},
    sum_data %>% filter(variable == "C+D") %>% {.$value})
  
  # error calculation (based on ion count errors!!!)
  expect_equal(
    left_join(a, b, by="ROI") %>% mutate(error = sqrt(value.y + value.x)) %>% {.$error},
    sum_data %>% filter(variable == "A+B") %>% {.$sigma})
  
  # other parameters check (filter_new)
  expect_equal(
    test_data %>% calculate_sums(c(`A`, `B`), c(`C`, `D`), quiet = T, filter_new = variable == "A+B") %>% 
      filter(data_type == "ion_sum") %>% {.$variable} %>% unique(), "A+B"
  )
  
})

