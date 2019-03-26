library(rebus.base)


### Name: ReplacementCase
### Title: Force the case of replacement values
### Aliases: ReplacementCase as_lower as_upper

### ** Examples

# Convert to title case using Perl regex
x <- "In caSE of DISASTER, PuLl tHe CoRd"
matching_rx <- capture(WRD) %R% capture(wrd(1, Inf))
replacement_rx <- as_upper(REF1) %R% as_lower(REF2)
gsub(matching_rx, replacement_rx, x, perl = TRUE)

# PCRE and ICU do not currently support this operation
# The next lines are intended to return gibberish
gsub(matching_rx, replacement_rx, x)
replacement_rx_icu <- as_upper(ICU_REF1) %R% as_lower(ICU_REF2)
stringi::stri_replace_all_regex(x, matching_rx, replacement_rx_icu)



