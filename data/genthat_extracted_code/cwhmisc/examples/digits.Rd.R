library(cwhmisc)


### Name: digits
### Title: Test, convert numbers
### Aliases: allDigits isNumeric str2dig
### Keywords: character,arith

### ** Examples

  allDigits(c("1231","89a8742")) #  TRUE FALSE
  isNumeric(c("1231","8.9e-2",".7d2")) # [1]  TRUE  TRUE FALSE
  str2dig("13245.") #  1 3 2 4 5 NA
    # for comparison, big numbers:
  int(10^(7:10)) # 10000000 100000000 1000000000 NA



