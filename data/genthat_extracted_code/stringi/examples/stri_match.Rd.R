library(stringi)


### Name: stri_match_all
### Title: Extract Regex Pattern Matches, Together with Capture Groups
### Aliases: stri_match_all stri_match_first stri_match_last stri_match
###   stri_match_all_regex stri_match_first_regex stri_match_last_regex

### ** Examples

stri_match_all_regex("breakfast=eggs, lunch=pizza, dessert=icecream",
   "(\\w+)=(\\w+)")
stri_match_all_regex(c("breakfast=eggs", "lunch=pizza", "no food here"),
   "(\\w+)=(\\w+)")
stri_match_all_regex(c("breakfast=eggs;lunch=pizza",
   "breakfast=bacon;lunch=spaghetti", "no food here"),
   "(\\w+)=(\\w+)")
stri_match_first_regex(c("breakfast=eggs;lunch=pizza",
   "breakfast=bacon;lunch=spaghetti", "no food here"),
   "(\\w+)=(\\w+)")
stri_match_last_regex(c("breakfast=eggs;lunch=pizza",
   "breakfast=bacon;lunch=spaghetti", "no food here"),
   "(\\w+)=(\\w+)")

stri_match_first_regex(c("abcd", ":abcd", ":abcd:"), "^(:)?([^:]*)(:)?$")
stri_match_first_regex(c("abcd", ":abcd", ":abcd:"), "^(:)?([^:]*)(:)?$", cg_missing="")

# Match all the pattern of the form XYX, including overlapping matches:
stri_match_all_regex("ACAGAGACTTTAGATAGAGAAGA", "(?=(([ACGT])[ACGT]\\2))")[[1]][,2]
# Compare the above to:
stri_extract_all_regex("ACAGAGACTTTAGATAGAGAAGA", "([ACGT])[ACGT]\\1")




