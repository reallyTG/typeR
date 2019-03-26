library(fuzzywuzzyR)


### Name: FuzzMatcher
### Title: Fuzzy character string matching ( ratios )
### Aliases: FuzzMatcher
### Keywords: datasets

### ** Examples


if (check_availability()) {


  library(fuzzywuzzyR)

  s1 = "Atlanta Falcons"

  s2 = "New York Jets"

  init = FuzzMatcher$new()

  init$Partial_token_set_ratio(string1 = s1, string2 = s2, force_ascii = TRUE, full_process = TRUE)

  init$Partial_token_sort_ratio(string1 = s1, string2 = s2, force_ascii = TRUE, full_process = TRUE)

  init$Ratio(string1 = s1, string2 = s2)

  init$QRATIO(string1 = s1, string2 = s2, force_ascii = TRUE)

  init$WRATIO(string1 = s1, string2 = s2, force_ascii = TRUE)

  init$UWRATIO(string1 = s1, string2 = s2)

  init$UQRATIO(string1 = s1, string2 = s2)

  init$Token_sort_ratio(string1 = s1, string2 = s2, force_ascii = TRUE, full_process = TRUE)

  init$Partial_ratio(string1 = s1, string2 = s2)

  init$Token_set_ratio(string1 = s1, string2 = s2, force_ascii = TRUE, full_process = TRUE)


}



