library(heemod)


### Name: rescale_discount_rate
### Title: Rescale Discount Rate
### Aliases: rescale_discount_rate

### ** Examples

  ## 1% monthly interest rate to annual
  rescale_discount_rate(0.01, 1, 12)
  ## 3% annual discount rate to (approximately) weekly 
  rescale_discount_rate(0.03, 52, 1)



