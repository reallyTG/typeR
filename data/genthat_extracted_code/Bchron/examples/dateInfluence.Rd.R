library(Bchron)


### Name: dateInfluence
### Title: Find the influence of the dates in a Bchronology run
### Aliases: dateInfluence

### ** Examples

## No test: 
data(Glendalough)
GlenOut = Bchronology(ages=Glendalough$ages,
                      ageSds=Glendalough$ageSds, 
                      calCurves=Glendalough$calCurves,
                      positions=Glendalough$position, 
                      positionThicknesses=Glendalough$thickness,
                      ids=Glendalough$id, 
                      predictPositions=seq(0,1500,by=10))
dateInfluence(GlenOut, whichDate = 4, measure = 'absMeanDiff')
## End(No test)



