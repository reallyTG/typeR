library(apaText)


### Name: apa.desc
### Title: Creates Mean (M) and Standard Deviation (SD) output with
###   confidence interval in APA style using Markdown.
### Aliases: apa.desc

### ** Examples

#2-way ANOVA Example
library(apaTables) #load apaTables to access goggles

#Main Effect Means: Gender
apa.desc(goggles, gender=="Female", dv = attractiveness)
apa.desc(goggles, gender=="Male", dv = attractiveness)

#Main Effect Means: Alcohol
apa.desc(goggles, alcohol=="None", dv = attractiveness)
apa.desc(goggles, alcohol=="2 Pints", dv = attractiveness)
apa.desc(goggles, alcohol=="4 Pints", dv = attractiveness)

#Cell Mean: Female, 2 Pints
apa.desc(goggles, alcohol=="2 Pints", gender=="Female", dv = attractiveness)



