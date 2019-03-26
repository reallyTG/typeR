library(dfped)


### Name: weightCYPsum
### Title: Proportion of the molecule metabolised by the CYPs for a child
###   according to age.
### Aliases: weightCYPsum

### ** Examples

age <- 2
perc_CYP <- data.frame("CYP3A4_5" = 0.7, "CYP1A2" = 0.3)
weightCYPsum(age, perc_CYP)



