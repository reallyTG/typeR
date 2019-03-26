library(PAFit)


### Name: test_linear_PA
### Title: Fitting various distributions to a degree vector
### Aliases: test_linear_PA

### ** Examples

  library("PAFit")
  set.seed(1)
  net   <- generate_BA()
  stats <- get_statistics(net, only_PA = TRUE)
  u     <- test_linear_PA(stats$final_deg)
  print(u)



