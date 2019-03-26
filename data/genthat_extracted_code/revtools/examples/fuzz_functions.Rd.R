library(revtools)


### Name: fuzz_functions
### Title: Functions for fuzzy string matching
### Aliases: fuzz_functions fuzzdist fuzz_m_ratio fuzz_partial_ratio
###   fuzz_token_sort_ratio fuzz_token_set_ratio

### ** Examples

fuzz_m_ratio("NEW YORK METS", "NEW YORK MEATS")
fuzz_partial_ratio(
  "YANKEES",
  c("NEW YORK YANKEES", "something else", "YNAKEES")
)
fuzz_token_sort_ratio("New York Mets vs Atlanta Braves", "Atlanta Braves vs New York Melts")
fuzz_token_set_ratio(
  a = "mariners vs angels other words",
  b = c("los angeles angels of anaheim at seattle mariners", "angeles angels of anaheim ")
)



