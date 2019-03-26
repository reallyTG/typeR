library(icd)


### Name: condense
### Title: Condense ICD-9 code by replacing complete families with parent
###   codes
### Aliases: condense condense.character icd9_condense_decimal
###   icd9_condense_short icd_condense.character icd_condense.icd9
###   icd_condense
### Keywords: internal manip

### ** Examples

kids <- children("V40")
kids
condense(kids, defined = TRUE)
kids_with_undefined <- children("V40", defined = FALSE)
head(kids_with_undefined)
length(kids_with_undefined)
condense(kids, defined = FALSE)

# what happens if we have additional codes?
# (condense will warn if we don't explicitly ask to condense
# based on defined or possible codes.)
condense(c(kids, "41100"), warn = FALSE)

# a good use is to summarise the contents of a comorbidity:
icd9_map_elix$CHF
condense(icd9_map_elix$CHF, warn = FALSE)
# explaining big groups of codes takes advantage of this:
explain_code(icd9_map_elix$CHF, condense = TRUE, warn = FALSE)



