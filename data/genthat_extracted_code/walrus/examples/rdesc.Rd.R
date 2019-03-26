library(walrus)


### Name: rdesc
### Title: Robust Descriptives
### Aliases: rdesc

### ** Examples


data('eurosoccer', package='WRS2')

SpainGermany <- subset(eurosoccer, eurosoccer$League == 'Spain' | eurosoccer$League == 'Germany')
SpainGermany <- droplevels(SpainGermany)

walrus::rdesc(
    data = SpainGermany,
    vars = "GoalsGame",
    splitBy = "League",
    med = TRUE)

#
#  ROBUST DESCRIPTIVES
#
#  Robust Descriptives
#  ----------------------------------------------------------
#                                                    SE
#  ----------------------------------------------------------
#    GoalsGame    Germany    Mean            1.46     0.105
#                            Trimmed mean    1.45    0.1341
#                            Median          1.43    0.1599
#
#                 Spain      Mean            1.45     0.101
#                            Trimmed mean    1.33    0.0601
#                            Median          1.30    0.0766
#  ----------------------------------------------------------
#




