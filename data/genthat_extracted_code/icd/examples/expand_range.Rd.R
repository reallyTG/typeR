library(icd)


### Name: expand_range
### Title: take two ICD-9 codes and expand range to include all child codes
### Aliases: expand_range expand_range.character expand_range.icd9
###   icd9_expand_range_short icd9_expand_range_decimal %i9da% %i9sa% %i9d%
###   %i9mj% %i9s% icd_expand_range.character icd_expand_range.icd10cm
###   icd_expand_range.icd9 icd_expand_range_major.icd9 icd_expand_range
### Keywords: internal

### ** Examples

"4280" %i9s% "4289"
"4280" %i9s% "42821"
"42799" %i9sa% "42802" # doesn't include 428 or 4280
"427.99" %i9da% "428.02"
"V80" %i9s% "V810"



