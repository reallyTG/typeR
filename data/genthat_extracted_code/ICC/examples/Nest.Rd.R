library(ICC)


### Name: Nest
### Title: Calculate the N individuals/groups required to estimate the ICC
###   with a desired confidence interval
### Aliases: Nest

### ** Examples

#Example 1
  n1<-Nest("h", w = 0.14, ICC = 0.1, k = 10)
  n1

#Example 2
  data(ChickWeight)
  Nest("p", w = 0.14, x = Chick, y = weight, data = ChickWeight)
  ex2 <- ICCest(Chick, weight, ChickWeight)
  ex2$UpperCI - ex2$LowerCI #confidence interval width of pilot study
  ex2

#Example 3
  Nest("h", w = 0.14, ICC = seq(0.05, 0.15, 0.05), k = seq(10, 12, 1))



