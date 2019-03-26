library(MOTE)


### Name: omega.F
### Title: Omega Squared for ANOVA from F
### Aliases: omega.F
### Keywords: ANOVA effect omega, size,

### ** Examples


#The following example is derived from the "bn1_data" dataset, included
#in the MOTE library.

#A health psychologist recorded the number of close inter-personal
#attachments of 45-year-olds who were in excellent, fair, or poor
#health. People in the Excellent Health group had 4, 3, 2, and 3
#close attachments; people in the Fair Health group had 3, 5,
#and 8 close attachments; and people in the Poor Health group
#had 3, 1, 0, and 2 close attachments.

anova_model = lm(formula = friends ~ group, data = bn1_data)
summary.aov(anova_model)

omega.F(dfm = 2, dfe = 8,
      Fvalue = 5.134, n = 11, a = .05)



