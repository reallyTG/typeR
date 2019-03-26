library(pedquant)


### Name: md_stock_financials
### Title: query financial statements
### Aliases: md_stock_financials

### ** Examples

## No test: 
# interactively specify type of financial table 
dat1 = md_stock_financials("000001")

# manually specify type of financial table
# type = "fr0"
dat2 = md_stock_financials("000001", type="fr0")
# or type = "fr0_summary"
dat3 = md_stock_financials("000001", type="fr0_summary")

# multiple symbols and statements
dat4 = md_stock_financials(c("000001", "600000"), type = "fi")

## End(No test)




