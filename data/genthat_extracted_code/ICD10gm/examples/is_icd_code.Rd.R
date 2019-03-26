library(ICD10gm)


### Name: is_icd_code
### Title: Test whether a string is a valid ICD code
### Aliases: is_icd_code

### ** Examples

is_icd_code("A09.9")
is_icd_code("A099")
is_icd_code("A09.9-")

is_icd_code("AA9")

# The following code is syntactically correct but
# has never been in use
is_icd_code("E15.9")




