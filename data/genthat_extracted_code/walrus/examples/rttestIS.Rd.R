library(walrus)


### Name: rttestIS
### Title: Robust Independent Samples T-Test
### Aliases: rttestIS

### ** Examples

data('eurosoccer', package='WRS2')

SpainGermany <- subset(eurosoccer, eurosoccer$League == 'Spain' | eurosoccer$League == 'Germany')
SpainGermany <- droplevels(SpainGermany)

rttestIS(SpainGermany,
         dep = 'GoalsScored',
         group = 'League',
         yuen = TRUE,
         mest = TRUE)

#
#  ROBUST INDEPENDENT SAMPLES T-TEST
#
#  Robust Independent Samples T-Test
#  ---------------------------------------------------------
#                                  t         df      p
#  ---------------------------------------------------------
#    GoalsScored    Yuen's test     0.297    17.3    0.770
#                   M-estimator    -0.933            0.993
#  ---------------------------------------------------------
#




