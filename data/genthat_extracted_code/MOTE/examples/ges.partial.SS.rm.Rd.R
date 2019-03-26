library(MOTE)


### Name: ges.partial.SS.rm
### Title: Partial Generalized Eta-Squared for ANOVA from F
### Aliases: ges.partial.SS.rm
### Keywords: ANOVA effect ges, size,

### ** Examples


#The following example is derived from the "rm2_data" dataset, included
#in the MOTE library.

#In this experiment people were given word pairs to rate based on
#their "relatedness". How many people out of a 100 would put LOST-FOUND
#together? Participants were given pairs of words and asked to rate them
#on how often they thought 100 people would give the second word if shown
#the first word.  The strength of the word pairs was manipulated through
#the actual rating (forward strength: FSG) and the strength of the reverse
#rating (backward strength: BSG). Is there an interaction between FSG and
#BSG when participants are estimating the relation between word pairs?

library(ez)
library(reshape)
long_mix = melt(rm2_data, id = c("subject", "group"))
long_mix$FSG = c(rep("Low-FSG", nrow(rm2_data)),
                 rep("High-FSG", nrow(rm2_data)),
                 rep("Low-FSG", nrow(rm2_data)),
                 rep("High-FSG", nrow(rm2_data)))
long_mix$BSG = c(rep("Low-BSG", nrow(rm2_data)*2),
                 rep("High-BSG", nrow(rm2_data)*2))

anova_model = ezANOVA(data = long_mix,
                      dv = value,
                      wid = subject,
                      within = .(FSG, BSG),
                      detailed = TRUE,
                      type = 3)

#You would calculate one partial GES value for each F-statistic.
#Here's an example for the interaction with typing in numbers.
ges.partial.SS.rm(dfm = 1, dfe = 157,
                  ssm = 2442.948, sss = 76988.13,
                  sse1 = 5402.567, sse2 = 8318.75, sse3 = 6074.417,
                  Fvalue = 70.9927, a = .05)

#Here's an example for the interaction with code.
ges.partial.SS.rm(dfm = anova_model$ANOVA$DFn[4],
                  dfe = anova_model$ANOVA$DFd[4],
                  ssm = anova_model$ANOVA$SSn[4],
                  sss = anova_model$ANOVA$SSd[1],
                  sse1 = anova_model$ANOVA$SSd[4],
                  sse2 = anova_model$ANOVA$SSd[2],
                  sse3 = anova_model$ANOVA$SSd[3],
                  Fvalue = anova_model$ANOVA$F[4],
                  a = .05)



