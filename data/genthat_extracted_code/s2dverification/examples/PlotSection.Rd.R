library(s2dverification)


### Name: PlotSection
### Title: Plots A Vertical Section
### Aliases: PlotSection
### Keywords: dynamic

### ** Examples

sampleData <- s2dverification::sampleDepthData
PlotSection(sampleData$mod[1, 1, 1, 1, , ], sampleData$lat, sampleData$depth,
            toptitle = 'temperature 1995-11 member 0')



