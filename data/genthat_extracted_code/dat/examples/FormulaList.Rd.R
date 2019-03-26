library(dat)


### Name: FL
### Title: Dynamically generate formulas
### Aliases: FL makeFormulas update.FormulaList

### ** Examples

FL(.n ~ mean(.n), .n = "variable")
as(makeFormulas(.n ~ mean(.n), .n = "variable"), "FormulaList")



