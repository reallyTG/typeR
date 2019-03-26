library(grattan)


### Name: model_income_tax
### Title: Modelled Income Tax
### Aliases: model_income_tax

### ** Examples


library(data.table)
library(hutils)

# With new tax-free threshold of $20,000:
if (requireNamespace("taxstats", quietly = TRUE)) {
  library(taxstats)
  library(magrittr)
     
  model_income_tax(sample_file_1314,
                   "2013-14",
                   ordinary_tax_thresholds = c(0, 20e3, 37e3, 80e3, 180e3)) %>%
    select_grep("tax", "Taxable_Income")

}




