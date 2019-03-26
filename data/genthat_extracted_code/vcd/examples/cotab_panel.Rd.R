library(vcd)


### Name: cotab_panel
### Title: Panel-generating Functions for Contingency Table Coplots
### Aliases: cotab_mosaic cotab_assoc cotab_sieve cotab_loddsratio
###   cotab_agreementplot cotab_coindep cotab_fourfold
### Keywords: hplot

### ** Examples

data("UCBAdmissions")

cotabplot(~ Admit + Gender | Dept, data = UCBAdmissions)
cotabplot(~ Admit + Gender | Dept, data = UCBAdmissions, panel = cotab_assoc)
cotabplot(~ Admit + Gender | Dept, data = UCBAdmissions, panel = cotab_fourfold)

ucb <- cotab_coindep(UCBAdmissions, condvars = "Dept", type = "assoc",
                     n = 5000, margins = c(3, 1, 1, 3))
cotabplot(~ Admit + Gender | Dept, data = UCBAdmissions, panel = ucb)



