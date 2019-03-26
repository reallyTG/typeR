library(icd)


### Name: children
### Title: Get children of ICD codes
### Aliases: children children.character children.icd9cm children.icd9
###   children.icd10 children.icd10cm icd_children.character
###   icd_children.icd10 icd_children.icd10cm icd_children.icd9
###   icd_children icd_children_defined icd_children_defined.icd10cm
### Keywords: manip

### ** Examples

library(magrittr, warn.conflicts = FALSE, quietly = TRUE) # optional

# no children other than self
children("10201", short_code = TRUE, defined = FALSE)

# guess it was ICD-9 and a short, not decimal code
children("0032")

# empty because 102.01 is not meaningful
children("10201", short_code = TRUE, defined = TRUE)
children("003", short_code = TRUE, defined = TRUE) %>%
  explain_code(condense = FALSE, short_code = TRUE)

children(short_code = FALSE, "100.0")
children(short_code = FALSE, "100.00")
children(short_code = FALSE, "2.34")



