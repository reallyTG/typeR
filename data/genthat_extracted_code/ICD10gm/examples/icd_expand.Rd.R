library(ICD10gm)


### Name: icd_expand
### Title: Expand list of ICD codes to include all possible subcodes
### Aliases: icd_expand

### ** Examples

# Incomplete or non-terminal codes expand to the right.
# This is useful to specified code blocks in a compact manner
icd_meta <- data.frame(ICD = "R1")
icd_expand(icd_meta, year = 2019)

# Optional metadata columns can be carried
# through with the specification
icd_meta <- data.frame(ICD = "M54", icd_label = "Back pain")
icd_expand(icd_meta, year = 2019, col_meta = "icd_label")




