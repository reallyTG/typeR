library(Bchron)


### Name: coreInfluence
### Title: Find the influence of dates in a pair of Bchronology runs across
###   the core
### Aliases: coreInfluence

### ** Examples

## No test: 
data(Glendalough)
# Start with a run that remove two dates
GlenOut1 = Bchronology(ages=Glendalough$ages[-c(3:4)],
                       ageSds=Glendalough$ageSds[-c(3:4)], 
                       calCurves=Glendalough$calCurves[-c(3:4)],
                       positions=Glendalough$position[-c(3:4)], 
                       positionThicknesses=Glendalough$thickness[-c(3:4)],
                       ids=Glendalough$id[-c(3:4)], 
                       predictPositions=seq(0,1500,by=10))
GlenOut2 = Bchronology(ages=Glendalough$ages,
                       ageSds=Glendalough$ageSds, 
                       calCurves=Glendalough$calCurves,
                       positions=Glendalough$position, 
                       positionThicknesses=Glendalough$thickness,
                       ids=Glendalough$id, 
                       predictPositions=seq(0,1500,by=10))

# Now compare their influence
coreInfluence(GlenOut1, 
              GlenOut2, 
              type = c('max', 'plot'), 
              xlab = 'Age (cal years BP)', 
              ylab = 'Depth (cm)', 
              main = 'Chronology difference at 95% for 
              Glendalough removing two dates', 
              las = 1)
## End(No test)



