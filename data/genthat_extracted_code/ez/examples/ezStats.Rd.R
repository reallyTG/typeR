library(ez)


### Name: ezStats
### Title: Compute descriptive statistics from a factorial experiment
### Aliases: ezStats

### ** Examples

#Read in the ANT data (see ?ANT).
data(ANT)
head(ANT)
ezPrecis(ANT)


#Run an ANOVA on the mean correct RT data.
mean_rt_anova = ezANOVA(
    data = ANT[ANT$error==0,]
    , dv = rt
    , wid = subnum
    , within = .(cue,flank)
    , between = group
)

#Show the ANOVA and assumption tests.
print(mean_rt_anova)

#Compute descriptives for the main effect of group.
group_descriptives = ezStats(
    data = ANT[ANT$error==0,]
    , dv = rt
    , wid = subnum
    , between = .(group)
)

#Show the descriptives.
print(group_descriptives)



