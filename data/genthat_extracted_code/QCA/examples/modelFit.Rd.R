library(QCA)


### Name: modelFit
### Title: Theory evaluation
### Aliases: modelFit
### Keywords: functions

### ** Examples

# Lipset fuzzy version data
data(LF)
ttLF <- truthTable(LF, outcome = "SURV", incl.cut = 0.8)


# parsimonious solution
pLF <- minimize(ttLF, include = "?")

modelFit(model = pLF, theory = "DEV*STB")


# hypothetical exploration of intermediate solutions
iLF <- minimize(ttLF, include = "?", dir.exp = "1,0,0,0,0")

modelFit(iLF, "DEV*STB")




