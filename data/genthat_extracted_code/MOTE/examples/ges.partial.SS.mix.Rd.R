library(MOTE)


### Name: ges.partial.SS.mix
### Title: Partial Generalized Eta-Squared for Mixed Design ANOVA from F
### Aliases: ges.partial.SS.mix
### Keywords: ANOVA effect ges, size,

### ** Examples


#The following example is derived from the "mix2_data" dataset, included
#in the MOTE library.

#Given previous research, we know that backward strength in free
#association tends to increase the ratings participants give when
#you ask them how many people out of 100 would say a word in
#response to a target word (like Family Feud). This result is
#tied to people’s overestimation of how well they think they know
#something, which is bad for studying. So, we gave people instructions
#on how to ignore the BSG.  Did it help? Is there an interaction
#between BSG and instructions given?

library(ez)
mix2_data$partno = 1:nrow(mix2_data)

library(reshape)
long_mix = melt(mix2_data, id = c("partno", "group"))

anova_model = ezANOVA(data = long_mix,
                      dv = value,
                      wid = partno,
                      between = group,
                      within = variable,
                      detailed = TRUE,
                      type = 3)

#You would calculate one partial GES value for each F-statistic.
#Here's an example for the interaction with typing in numbers.
ges.partial.SS.mix(dfm = 1, dfe = 156,
                   ssm = 71.07608,
                   sss = 30936.498,
                   sse = 8657.094,
                   Fvalue = 1.280784, a = .05)

#Here's an example for the interaction with code.
ges.partial.SS.mix(dfm = anova_model$ANOVA$DFn[4],
               dfe = anova_model$ANOVA$DFd[4],
               ssm = anova_model$ANOVA$SSn[4],
               sss = anova_model$ANOVA$SSd[1],
               sse = anova_model$ANOVA$SSd[4],
               Fvalue =  anova_model$ANOVA$F[4],
               a = .05)



