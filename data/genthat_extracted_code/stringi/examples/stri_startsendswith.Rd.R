library(stringi)


### Name: stri_startswith
### Title: Determine if the Start or End of a String Matches a Pattern
### Aliases: stri_startswith stri_endswith stri_startswith_fixed
###   stri_endswith_fixed stri_startswith_charclass stri_endswith_charclass
###   stri_startswith_coll stri_endswith_coll

### ** Examples

stri_startswith_charclass(" trim me! ", "\\p{WSpace}")
stri_startswith_fixed(c("a1", "a2", "b3", "a4", "c5"), "a")
stri_detect_regex(c("a1", "a2", "b3", "a4", "c5"), "^a")
stri_startswith_fixed("ababa", "ba")
stri_startswith_fixed("ababa", "ba", from=2)
stri_startswith_coll(c("a1", "A2", "b3", "A4", "C5"), "a", strength=1)
pat <- stri_paste("\u0635\u0644\u0649 \u0627\u0644\u0644\u0647 ",
                  "\u0639\u0644\u064a\u0647 \u0648\u0633\u0644\u0645XYZ")
stri_endswith_coll("\ufdfa\ufdfa\ufdfaXYZ", pat, strength=1)




