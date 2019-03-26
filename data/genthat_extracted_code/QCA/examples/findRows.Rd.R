library(QCA)


### Name: findRows
### Title: Find untenable configurations
### Aliases: findRows
### Keywords: functions

### ** Examples

# Lipset's binary crisp version
data(LC)
ttLC <- truthTable(LC, "SURV", show.cases = TRUE)

findRows("DEV*ind*STB", ttLC)

## all subset rows from the truth table, not only the remainders
findRows("DEV*ind*STB", ttLC, remainders = FALSE)


# Lipset's fuzzy version
data(LF)
ttLF <- truthTable(LF, outcome = "SURV", incl.cut = 0.8)

findRows(obj = ttLF, type = 2) # contradictory simplifying assumptions



