library(apa)


### Name: anova_apa
### Title: Report ANOVA in APA style
### Aliases: anova_apa

### ** Examples

# Using the ez package
library(ez)
data(ANT)

x <- ezANOVA(ANT[ANT$error==0,], dv = rt, wid = subnum,
             within = c(cue, flank), between = group, detailed = TRUE)
anova_apa(x)

# Using the afex package
library(afex)
data(md_12.1)

y <- aov_ez(id = "id", dv = "rt", data = md_12.1,
            within = c("angle", "noise"))
anova_apa(y)




