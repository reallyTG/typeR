library(vcd)


### Name: cotabplot
### Title: Coplot for Contingency Tables
### Aliases: cotabplot cotabplot.default cotabplot.formula
### Keywords: hplot

### ** Examples

data("UCBAdmissions")

cotabplot(~ Admit + Gender | Dept, data = UCBAdmissions)
cotabplot(~ Admit + Gender | Dept, data = UCBAdmissions, panel = cotab_assoc)

ucb <- cotab_coindep(UCBAdmissions, condvars = "Dept", type = "assoc",
                     n = 5000, margins = c(3, 1, 1, 3))
cotabplot(~ Admit + Gender | Dept, data = UCBAdmissions, panel = ucb)



