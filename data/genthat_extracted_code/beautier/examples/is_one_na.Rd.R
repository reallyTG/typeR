library(beautier)


### Name: is_one_na
### Title: Determines if x is one NA
### Aliases: is_one_na

### ** Examples

  testit::assert(is_one_na(NA))
  testit::assert(!is_one_na(NULL))
  testit::assert(!is_one_na(42))
  testit::assert(!is_one_na("Hello"))
  testit::assert(!is_one_na(3.14))
  testit::assert(!is_one_na(c(NA, NA)))



