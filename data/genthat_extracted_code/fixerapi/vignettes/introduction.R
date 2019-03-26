## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE----------------------------------------------------------
#  library(fixer)
#  today_symbols <- fixer_latest(base = "EUR",
#                                symbols = c("JPY", "GBP", "USD", "CAD", "CHF"))
#  
#  print(today_symbols)
#  
#  #> A tibble: 5 x 2
#  #>   name    value
#  #>   <chr>   <dbl>
#  #> 1 JPY   131.
#  #> 2 GBP     0.873
#  #> 3 USD     1.23
#  #> 4 CAD     1.57
#  #> 5 CHF     1.18
#  
#  
#  today_all <- fixer_latest(base = "EUR")
#  
#  print(today_all)
#  
#  #> A tibble: 168 x 2
#  #>    name   value
#  #>    <chr>  <dbl>
#  #>  1 AED     4.51
#  #>  2 AFN    84.9
#  #>  3 ALL   130.
#  #>  4 AMD   589.
#  #>  5 ANG     2.18
#  #>  6 AOA   263.
#  #>  7 ARS    24.7
#  #>  8 AUD     1.60
#  #>  9 AWG     2.18
#  #> 10 AZN     2.09
#  #> ... with 158 more rows

