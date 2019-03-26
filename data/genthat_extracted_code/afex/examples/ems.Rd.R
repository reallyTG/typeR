library(afex)


### Name: ems
### Title: Expected values of mean squares for factorial designs Implements
###   the Cornfield-Tukey algorithm for deriving the expected values of the
###   mean squares for factorial designs.
### Aliases: ems

### ** Examples

# 2x2 mixed anova
# A varies between-subjects, B varies within-subjects
ems(r ~ A*B*S, nested="A/S", random="S")

# Clark (1973) example
# random Subjects, random Words, fixed Treatments
ems(r ~ S*W*T, nested="T/W", random="SW")

# EMSs for Clark design if Words are fixed
ems(r ~ S*W*T, nested="T/W", random="S")




