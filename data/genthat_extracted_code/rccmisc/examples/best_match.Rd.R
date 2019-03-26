library(rccmisc)


### Name: best_match
### Title: Tries to correct misspelling of character string
### Aliases: best_match

### ** Examples

best_match(c("Hej_apa!", "erik", "babian"), c("hej apa", "hej bepa", "kungen", "Erik"))
best_match(c("Hej_apa", "erik", "babian"),
   c("hej apa", "hej bepa", "kungen", "Erik"), no_match = FALSE)



