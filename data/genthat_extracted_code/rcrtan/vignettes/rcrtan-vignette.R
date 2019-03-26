## ---- echo=FALSE, warning=FALSE, message=FALSE, error=FALSE--------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", echo=TRUE, warning=FALSE, message=FALSE, error=FALSE)

## ------------------------------------------------------------------------

# Load the library
library(rcrtan)

# Some data
test_data <- tibble::tribble(
                 ~ID, ~Q1, ~Q2, ~Q3, ~Q4, ~Q5, ~Q6, ~Q7, ~Q8, ~Q9, ~Q10, ~Total,
               1441L,  1L,  1L,  1L,  1L,  1L,  1L,  1L,  1L,  1L,   1L,    10L,
               1387L,  1L,  1L,  1L,  1L,  1L,  0L,  0L,  1L,  1L,   1L,     8L,
               1994L,  1L,  1L,  1L,  1L,  1L,  0L,  0L,  1L,  1L,   1L,     8L,
               1453L,  1L,  1L,  1L,  1L,  0L,  1L,  0L,  1L,  1L,   1L,     8L,
               1679L,  1L,  0L,  1L,  0L,  0L,  1L,  1L,  1L,  1L,   1L,     7L,
               1899L,  1L,  1L,  1L,  1L,  0L,  1L,  0L,  1L,  1L,   1L,     8L,
               1631L,  1L,  1L,  1L,  1L,  1L,  1L,  0L,  1L,  1L,   1L,     9L,
               1894L,  1L,  0L,  1L,  1L,  1L,  1L,  1L,  1L,  1L,   1L,     9L,
               1206L,  0L,  0L,  1L,  1L,  0L,  1L,  0L,  1L,  0L,   1L,     5L,
               1163L,  1L,  1L,  1L,  1L,  1L,  0L,  0L,  1L,  1L,   1L,     8L,
               1964L,  1L,  1L,  1L,  1L,  1L,  1L,  1L,  1L,  1L,   1L,    10L,
               1050L,  1L,  1L,  1L,  1L,  1L,  1L,  1L,  1L,  1L,   1L,    10L,
               1034L,  1L,  1L,  1L,  1L,  1L,  1L,  1L,  1L,  1L,   1L,    10L,
               1826L,  1L,  0L,  1L,  1L,  1L,  1L,  1L,  1L,  1L,   1L,     9L,
               1973L,  1L,  1L,  1L,  1L,  0L,  1L,  0L,  1L,  1L,   1L,     8L,
               1936L,  0L,  1L,  1L,  1L,  1L,  1L,  1L,  1L,  1L,   0L,     8L,
               1114L,  1L,  0L,  0L,  1L,  1L,  0L,  0L,  0L,  1L,   1L,     5L,
               1181L,  0L,  1L,  1L,  1L,  0L,  0L,  1L,  1L,  1L,   1L,     7L,
               1917L,  1L,  1L,  1L,  1L,  0L,  1L,  0L,  1L,  1L,   1L,     8L
               )


# Analyze the dichomous data. Use look_up = TRUE if you want to see the look up tables from Subkoviak (1988).
sub_ex_one <- subkoviak(data = test_data, items = 2:11, raw_cut_score = 8)

## ------------------------------------------------------------------------
sub_ex_one

## ------------------------------------------------------------------------
sub_ex_two <- subkoviak(data = test_data, items = 10, raw_cut_score = 8, total = "Total")

sub_ex_two

## ------------------------------------------------------------------------
# When item level information is known
phi_d_one <- phi_domain(data = test_data, items = 2:11)

# When only total scores and number of items on the test are known
phi_d_two <- phi_domain(data = test_data, items = 10, total = "Total")

phi_d_one

phi_d_two

## ------------------------------------------------------------------------
phi_l_one <- rcrtan::phi_lambda(test_data, 2:11, cut_score = 0.80)

phi_l_two <- phi_lambda(test_data, 10, cut_score = 0.80, total = 'Total')

phi_l_one

phi_l_two

