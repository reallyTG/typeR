library(ecotox)


### Name: LT_probit
### Title: Lethal Time Probit
### Aliases: LT_probit

### ** Examples

head(lampreytime)

results <- LT_probit((response / total) ~ log10(hour),
p = c(50, 99),
weights = total,
data = lampreytime,
subset = c(month == "May"))

#view calculated LT50 and LT99 for seasonal
#toxicity of a piscicide, 3-trifluoromethyl-4-nitrophenol, to lamprey in 2011

results

#dose-response curve can be plotted using 'ggplot2'



