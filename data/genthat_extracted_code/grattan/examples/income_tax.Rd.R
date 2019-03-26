library(grattan)


### Name: income_tax
### Title: Income tax payable
### Aliases: income_tax

### ** Examples


income_tax(50e3, "2013-14")

## Calculate tax for each lodger in the 2013-14 sample file.
if (requireNamespace("taxstats", quietly = TRUE)) {
  library(data.table)
  library(taxstats)
  
  s1314 <- as.data.table(sample_file_1314)
  s1314[, tax := income_tax(Taxable_Income, "2013-14", .dots.ATO = s1314)]
}




