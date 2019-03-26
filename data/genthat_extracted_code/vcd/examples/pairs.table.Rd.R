library(vcd)


### Name: pairs.table
### Title: Pairs Plot for Contingency Tables
### Aliases: pairs.table pairs.structable
### Keywords: hplot

### ** Examples

data("UCBAdmissions")
data("PreSex")
data(HairEyeColor)
hec = structable(Eye ~ Sex + Hair, data = HairEyeColor)

pairs(PreSex)
pairs(UCBAdmissions)
pairs(UCBAdmissions, upper_panel_args = list(shade = TRUE))
pairs(UCBAdmissions, lower_panel = pairs_mosaic(type = "conditional"))
pairs(UCBAdmissions, diag_panel = pairs_text)
pairs(UCBAdmissions, upper_panel = pairs_assoc, shade = TRUE)
pairs(hec, highlighting = 2, diag_panel_args = list(fill = grey.colors))
pairs(hec, highlighting = 2, diag_panel = pairs_diagonal_mosaic,
           diag_panel_args = list(fill = grey.colors, alternate_labels =TRUE))




