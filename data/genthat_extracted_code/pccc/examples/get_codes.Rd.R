library(pccc)


### Name: get_codes
### Title: Get (view) Diagnostic and Procedure Codes
### Aliases: get_codes

### ** Examples

# All ICD 9 codes for CCC
get_codes(9)

# All ICD 10 codes for CCC
get_codes(10)

# Get all the codes for ICD 9 related to malignancy
get_codes(9)["malignancy", ] 



