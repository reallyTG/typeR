## ----loadPackages--------------------------------------------------------
library(knitr)
library(magrittr)
library(data.table)
library(hutils)
library(grattan)

## ----tax-table-201718----------------------------------------------------
dollar <- function(x) paste0("$", prettyNum(x, big.mark = ","))
grattan:::tax_table2[fy_year == "2017-18",
                     .(`Lower bracket` = dollar(lower_bracket),
                       `Tax payable` = dollar(tax_at),
                       `Marginal rate` = marginal_rate)] %>%
  kable(align = "r")

## ------------------------------------------------------------------------
income <- 50e3
fy_year <- "2017-18"

ifelse(fy_year == '2017-18',
       ifelse(income < 18200,
              0,
              ifelse(income < 37e3,
                     0 + 0.19 * (income - 18200),
                     ifelse(income < 87e3,
                            3572 + 0.325 * (income - 37000),
                            ifelse(income < 180e3,
                                   19822 + 0.37 * (income - 87e3),
                                   54232 + 0.45 * (income - 180e3))))),
       stop("Not yet implemented."))

## ------------------------------------------------------------------------
input <- data.table(income = income)
tax_table2 <- copy(grattan:::tax_table2)

# Record the order if needed
input[, the_order := .I]
input[, fy_year := "2017-18"]
setkey(input, fy_year, income)

tax_table2[input, roll = TRUE] %>%
  .[, tax := tax_at + (income - lower_bracket) * marginal_rate] %>%
  .[order(the_order)]

