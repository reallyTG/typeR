library(apaTables)


### Name: apa.aov.table
### Title: Creates a fixed-effects ANOVA table in APA style
### Aliases: apa.aov.table

### ** Examples

#Example 1: 1-way from Field et al. (2012) Discovery Statistics Using R
options(contrasts = c("contr.helmert", "contr.poly"))
lm_output <- lm(libido ~ dose, data = viagra)
apa.aov.table(lm_output, filename = "ex1_anova_table.doc")

# Example 2: 2-way from Fidler & Thompson (2001)
# You must set these contrasts to ensure values match SPSS
options(contrasts = c("contr.helmert", "contr.poly"))
lm_output <- lm(dv ~ a*b, data = fidler_thompson)
apa.aov.table(lm_output,filename = "ex2_anova_table.doc")

#Example 3: 2-way from Field et al. (2012) Discovery Statistics Using R
# You must set these contrasts to ensure values match SPSS
options(contrasts = c("contr.helmert", "contr.poly"))
lm_output <- lm(attractiveness ~ gender*alcohol, data = goggles)
apa.aov.table(lm_output, filename = "ex3_anova_table.doc")



