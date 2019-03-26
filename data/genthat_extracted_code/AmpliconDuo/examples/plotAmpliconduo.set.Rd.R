library(AmpliconDuo)


### Name: plotAmpliconduo.set
### Title: Frequency-Frequency Plot Arrangement Focusing On Significant
###   Deviations In Amplicon Occurences
### Aliases: plotAmpliconduo.set
### Keywords: hplot

### ** Examples

## loads example data of ampliconduo data frames
data(amplicons)

## plot amplicon frequencies of multiple ampliconduo data frames
plotAmpliconduo.set(amplicons[1:4], nrow = 3, h.start = 100)

plotAmpliconduo.set(amplicons[1:4], nrow = 1, corrected = FALSE, color.treshold = 0.1)



