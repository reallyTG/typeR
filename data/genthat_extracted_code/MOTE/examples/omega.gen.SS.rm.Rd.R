library(MOTE)


### Name: omega.gen.SS.rm
### Title: Generalized Omega Squared for Multi-Way and Mixed ANOVA from F
### Aliases: omega.gen.SS.rm
### Keywords: ANOVA effect omega, size,

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

#You would calculate one partial GOS value for each F-statistic.
#Here's an example for the main effect 1 with typing in numbers.
 omega.gen.SS.rm(dfm = 1, dfe = 156,
                 ssm = 6842.46829,
                 ssm2 = 14336.07886,
                 sst = sum(c(30936.498, 6842.46829,
                 14336.07886, 8657.094, 71.07608)),
                 mss = 30936.498 / 156,
                 j = 2, Fvalue = 34.503746, a = .05)

#Here's an example for the main effect 1 with code.
 omega.gen.SS.rm(dfm = anova_model$ANOVA$DFn[2],
                 dfe = anova_model$ANOVA$DFd[2],
                 ssm = anova_model$ANOVA$SSn[2],
                 ssm2 = anova_model$ANOVA$SSn[3],
                 sst = sum(c(anova_model$ANOVA$SSn[-1], anova_model$ANOVA$SSd[c(1,3)])),
                 mss = anova_model$ANOVA$SSd[1]/anova_model$ANOVA$DFd[1],
                 j = anova_model$ANOVA$DFn[3]+1,
                 Fvalue = anova_model$ANOVA$F[2], a = .05)



